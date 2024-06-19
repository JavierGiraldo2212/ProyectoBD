-- Creación de Roles --
DROP ROLE IF exists Coordinador_de_Sede, Personal_de_Apoyo, Conferencista, Egresado, Empresa;
CREATE ROLE Coordinador_de_Sede;
CREATE ROLE Personal_de_Apoyo;
CREATE ROLE Conferencista;
CREATE ROLE Egresado;
CREATE ROLE Empresa;
----------------------------------------------------
-- Asignación de permisos de acuerdo a las vistas --
----------------------------------------------------
-- Asitencia a los diálogos --
GRANT SELECT, UPDATE ON vw_asistentes_dialogos TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_asistentes_dialogos TO Personal_de_Apoyo;
-- Asitencia a las cátedras --
GRANT SELECT, UPDATE ON vw_asistentes_catedras TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_asistentes_catedras TO Personal_de_Apoyo;
-- Experiencia laboral --
GRANT SELECT, UPDATE ON vw_experiencia_laboral TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_experiencia_laboral TO Personal_de_Apoyo;
GRANT SELECT, UPDATE ON vw_experiencia_laboral TO Egresado;
-- Lista de contacto de egresados --
GRANT SELECT, UPDATE ON vw_info_contacto_egresados_Bogota TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_info_contacto_egresados_Bogota TO Personal_de_Apoyo;
-- Lista del personal de apoyo de la facultad --
GRANT SELECT, UPDATE ON vw_personal_apoyo_Bogota TO Coordinador_de_Sede;
-- Número de asistentes a diálogos --
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_dialogos TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_dialogos TO Personal_de_Apoyo;
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_dialogos TO Conferencista;
-- Número de asistentes a cátedra --
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_catedra TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_catedra TO Personal_de_Apoyo;
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_catedra TO Egresado;
-- Lista de egresados de derecho --
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_catedra TO Coordinador_de_Sede;
GRANT SELECT, UPDATE ON vw_cantidad_asisitentes_catedra TO Personal_de_Apoyo;
-- Ofertas laborales -- 
GRANT SELECT, UPDATE ON vw_ofertas_laborales TO Egresado;
------------------------------------------
-- Permisos generales para cada Rol --
------------------------------------------
--               Director               --
GRANT SELECT ON catedra TO Coordinador_de_Sede;
GRANT SELECT ON conferencista TO Coordinador_de_Sede;
GRANT SELECT ON dialogos_egresados TO Coordinador_de_Sede;
GRANT SELECT ON egresado TO Coordinador_de_Sede;
GRANT SELECT ON egresado_habla_idioma TO Coordinador_de_Sede;
GRANT SELECT ON eventos TO Coordinador_de_Sede;
GRANT SELECT ON facultad TO Coordinador_de_Sede;
GRANT SELECT ON sede TO Coordinador_de_Sede;
GRANT SELECT ON torneo_deportivo TO Coordinador_de_Sede;
GRANT SELECT ON oferta_laboral TO Coordinador_de_Sede;
GRANT SELECT ON personal_apoyo TO Coordinador_de_Sede;
GRANT SELECT ON equipo TO Coordinador_de_Sede;
GRANT SELECT ON empresa TO Coordinador_de_Sede;

--           Personal de Apoyo          --
GRANT SELECT ON catedra TO Personal_de_Apoyo;
GRANT SELECT ON conferencista TO Personal_de_Apoyo;
GRANT SELECT ON dialogos_egresados TO Personal_de_Apoyo;
GRANT SELECT ON egresado TO Personal_de_Apoyo;
GRANT SELECT ON egresado_habla_idioma TO Personal_de_Apoyo;
GRANT SELECT ON eventos TO Personal_de_Apoyo;
GRANT SELECT ON facultad TO Personal_de_Apoyo;
GRANT SELECT ON sede TO Personal_de_Apoyo;
GRANT SELECT ON torneo_deportivo TO Personal_de_Apoyo;
GRANT SELECT ON oferta_laboral TO Personal_de_Apoyo;
GRANT SELECT ON equipo TO Personal_de_Apoyo;
GRANT SELECT ON empresa TO Personal_de_Apoyo;

--                Egresado              --
GRANT SELECT ON sede TO Egresado;
GRANT SELECT ON facultad TO Egresado;
GRANT SELECT ON eventos TO Egresado;
GRANT SELECT ON torneo_deportivo TO Egresado;
GRANT SELECT ON equipo TO Egresado;
GRANT SELECT ON catedra TO Egresado;
GRANT SELECT ON dialogos_egresados TO Egresado;
GRANT SELECT ON oferta_laboral TO Egresado;

--                Empresa              --
GRANT SELECT ON sede TO Empresa;
GRANT SELECT ON facultad TO Empresa;
GRANT SELECT, INSERT, UPDATE ON oferta_laboral TO Empresa;

----------------------------------------------------
-- Asignación de permisos de acuerdo a los procedimientos y funciones --
----------------------------------------------------
GRANT EXECUTE ON PROCEDURE sp_ingresar_equipo TO Coordinador_de_Sede;
GRANT EXECUTE ON PROCEDURE sp_salir_equipo TO Coordinador_de_Sede;
GRANT EXECUTE ON FUNCTION f_promedio_edad_equipo TO Coordinador_de_Sede;
GRANT EXECUTE ON FUNCTION f_Tiempo_experiencia TO Coordinador_de_Sede;
GRANT EXECUTE ON FUNCTION f_Asistentes_catedra TO Coordinador_de_Sede;
GRANT EXECUTE ON FUNCTION f_Asistentes_dialogos TO Coordinador_de_Sede;

GRANT EXECUTE ON FUNCTION f_encontrar_NIT TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_descripcion_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_campo_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_telefono_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_direccion_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_correo_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_pagina_web_empresa TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_ingresar_oferta TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Estado_oferta_laboral TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Salario_oferta_laboral TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_ExpRequerida_oferta_laboral TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Area_oferta_laboral TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_cambiar_TipoContrato_oferta_laboral TO Empresa;
GRANT EXECUTE ON PROCEDURE sp_ver_oferta_laboral_unica TO Empresa;

GRANT EXECUTE ON FUNCTION f_encontrar_Cedula TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_experiencia_laboral_unica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_crear_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_SituacionActual_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_SectorLaboralActual_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Cargo_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_FechaInicio_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_FechaFin_experiencia_laboral TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_formacion_academica_unica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_crear_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Universidad_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Facultad_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_Programa_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_NivelAcademico_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_cambiar_AñoGrado_formacion_academica TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ingresar_equipo TO egresado;
GRANT EXECUTE ON PROCEDURE sp_salir_equipo TO egresado;
GRANT EXECUTE ON PROCEDURE sp_ver_persona_de_apoyo TO egresado;

GRANT EXECUTE ON PROCEDURE sp_crear_representante_empresa TO Personal_de_Apoyo;
GRANT EXECUTE ON PROCEDURE sp_crear_empresa TO Personal_de_Apoyo;
GRANT EXECUTE ON PROCEDURE sp_generar_usuario TO Personal_de_Apoyo;
GRANT EXECUTE ON PROCEDURE sp_crear_egresado TO Personal_de_Apoyo;


----------------------------------------------------
-- Creación de usuarios y asignación de roles --
----------------------------------------------------
CREATE USER 'carlos.rodriguez.E'@'localhost' IDENTIFIED BY '00112211';
GRANT Empresa TO 'carlos.rodriguez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'carlos.rodriguez.E'@'localhost';
CREATE USER 'maria.gomez.E'@'localhost' IDENTIFIED BY '00112212';
GRANT Empresa TO 'maria.gomez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'maria.gomez.E'@'localhost';
CREATE USER 'juan.fernandez.E'@'localhost' IDENTIFIED BY '00112213';
GRANT Empresa TO 'juan.fernandez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'juan.fernandez.E'@'localhost';
CREATE USER 'ana.martin.E'@'localhost' IDENTIFIED BY '00112214';
GRANT Empresa TO 'ana.martin.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'ana.martin.E'@'localhost';
CREATE USER 'luis.sanchez.E'@'localhost' IDENTIFIED BY '00112215';
GRANT Empresa TO 'luis.sanchez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'luis.sanchez.E'@'localhost';
CREATE USER 'laura.jimenez.E'@'localhost' IDENTIFIED BY '00112216';
GRANT Empresa TO 'laura.jimenez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'laura.jimenez.E'@'localhost';
CREATE USER 'pedro.ruiz.E'@'localhost' IDENTIFIED BY '00112217';
GRANT Empresa TO 'pedro.ruiz.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'pedro.ruiz.E'@'localhost';
CREATE USER 'sofia.ramirez.E'@'localhost' IDENTIFIED BY '00112218';
GRANT Empresa TO 'sofia.ramirez.E'@'localhost';
SET DEFAULT ROLE Empresa TO 'sofia.ramirez.E'@'localhost';

-- CREATE USER 'johan.ramos'@'localhost' IDENTIFIED BY '11223300';
-- GRANT Personal_de_Apoyo TO 'johan.ramos'@'localhost';
-- SET DEFAULT ROLE Personal_de_Apoyo TO 'johan.ramos'@'localhost';
CREATE USER 'brian.perez'@'localhost' IDENTIFIED BY '11223311';
GRANT Personal_de_Apoyo TO 'brian.perez'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'brian.perez'@'localhost';
CREATE USER 'gustavo.cortes'@'localhost' IDENTIFIED BY '11223322';
GRANT Personal_de_Apoyo TO 'gustavo.cortes'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'gustavo.cortes'@'localhost';
CREATE USER 'john.amaya'@'localhost' IDENTIFIED BY '11223333';
GRANT Personal_de_Apoyo TO 'john.amaya'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'john.amaya'@'localhost';
CREATE USER 'lucho.flores'@'localhost' IDENTIFIED BY '11223344';
GRANT Personal_de_Apoyo TO 'lucho.flores'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'lucho.flores'@'localhost';
CREATE USER 'ximena.peña'@'localhost' IDENTIFIED BY '11223355';
GRANT Personal_de_Apoyo TO 'ximena.peña'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'ximena.peña'@'localhost';
CREATE USER 'eva.ospina'@'localhost' IDENTIFIED BY '11223366';
GRANT Personal_de_Apoyo TO 'eva.ospina'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'eva.ospina'@'localhost';
CREATE USER 'sara.samchez'@'localhost' IDENTIFIED BY '11223377';
GRANT Personal_de_Apoyo TO 'sara.samchez'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'sara.samchez'@'localhost';
CREATE USER 'alejandra.ramirez'@'localhost' IDENTIFIED BY '11223388';
GRANT Personal_de_Apoyo TO 'alejandra.ramirez'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'alejandra.ramirez'@'localhost';
CREATE USER 'paul.gonzales'@'localhost' IDENTIFIED BY '11223399';
GRANT Personal_de_Apoyo TO 'paul.gonzales'@'localhost';
SET DEFAULT ROLE Personal_de_Apoyo TO 'paul.gonzales'@'localhost';

CREATE USER 'diana.perez001'@'localhost' IDENTIFIED BY '11220011';
GRANT Egresado TO 'diana.perez001'@'localhost';
SET DEFAULT ROLE Egresado TO 'diana.perez001'@'localhost';
CREATE USER 'maria.rodriguez001'@'localhost' IDENTIFIED BY '11220022';
GRANT Egresado TO 'maria.rodriguez001'@'localhost';
SET DEFAULT ROLE Egresado TO 'maria.rodriguez001'@'localhost';
CREATE USER 'fernanda.garcia001'@'localhost' IDENTIFIED BY '11220033';
GRANT Egresado TO 'fernanda.garcia001'@'localhost';
SET DEFAULT ROLE Egresado TO 'fernanda.garcia001'@'localhost';
CREATE USER 'luisa.garcia005'@'localhost' IDENTIFIED BY '11220014';
GRANT Egresado TO 'luisa.garcia005'@'localhost';
SET DEFAULT ROLE Egresado TO 'luisa.garcia005'@'localhost';
CREATE USER 'isabel.mendoza005'@'localhost' IDENTIFIED BY '11220015';
GRANT Egresado TO 'isabel.mendoza005'@'localhost';
SET DEFAULT ROLE Egresado TO 'isabel.mendoza005'@'localhost';
CREATE USER 'andrea.gonzalez005'@'localhost' IDENTIFIED BY '11220016';
GRANT Egresado TO 'andrea.gonzalez005'@'localhost';
SET DEFAULT ROLE Egresado TO 'andrea.gonzalez005'@'localhost';
CREATE USER 'camila.castro009'@'localhost' IDENTIFIED BY '11220025';
GRANT Egresado TO 'camila.castro009'@'localhost';
SET DEFAULT ROLE Egresado TO 'camila.castro009'@'localhost';
CREATE USER 'lorena.paredes'@'localhost' IDENTIFIED BY '11220026';
GRANT Egresado TO 'lorena.paredes'@'localhost';
SET DEFAULT ROLE Egresado TO 'lorena.paredes'@'localhost';
CREATE USER 'jose.hernandez002'@'localhost' IDENTIFIED BY '11220004';
GRANT Egresado TO 'jose.hernandez002'@'localhost';
SET DEFAULT ROLE Egresado TO 'jose.hernandez002'@'localhost';
CREATE USER 'luis.ramirez002'@'localhost' IDENTIFIED BY '11220005';
GRANT Egresado TO 'luis.ramirez002'@'localhost';
SET DEFAULT ROLE Egresado TO 'luis.ramirez002'@'localhost';
CREATE USER 'lautaro.sanchez002'@'localhost' IDENTIFIED BY '11220006';
GRANT Egresado TO 'lautaro.sanchez002'@'localhost';
SET DEFAULT ROLE Egresado TO 'lautaro.sanchez002'@'localhost';
CREATE USER 'martin.soto006'@'localhost' IDENTIFIED BY '11220016';
GRANT Egresado TO 'martin.soto006'@'localhost';
SET DEFAULT ROLE Egresado TO 'martin.soto006'@'localhost';
CREATE USER 'alberto.moreno006'@'localhost' IDENTIFIED BY '11220017';
GRANT Egresado TO 'alberto.moreno006'@'localhost';
SET DEFAULT ROLE Egresado TO 'alberto.moreno006'@'localhost';
CREATE USER 'patricio.ortiz006'@'localhost' IDENTIFIED BY '11220018';
GRANT Egresado TO 'patricio.ortiz006'@'localhost';
SET DEFAULT ROLE Egresado TO 'patricio.ortiz006'@'localhost';
CREATE USER 'miguel.lopez003'@'localhost' IDENTIFIED BY '11220007';
GRANT Egresado TO 'miguel.lopez003'@'localhost';
SET DEFAULT ROLE Egresado TO 'miguel.lopez003'@'localhost';
CREATE USER 'lucia.diaz003'@'localhost' IDENTIFIED BY '11220008';
GRANT Egresado TO 'lucia.diaz003'@'localhost';
SET DEFAULT ROLE Egresado TO 'lucia.diaz003'@'localhost';
CREATE USER 'jorge.martinez003'@'localhost' IDENTIFIED BY '11220009';
GRANT Egresado TO 'jorge.martinez003'@'localhost';
SET DEFAULT ROLE Egresado TO 'jorge.martinez003'@'localhost';
CREATE USER 'fernando.cruz007'@'localhost' IDENTIFIED BY '11220019';
GRANT Egresado TO 'fernando.cruz007'@'localhost';
SET DEFAULT ROLE Egresado TO 'fernando.cruz007'@'localhost';
CREATE USER 'claudia.pena007'@'localhost' IDENTIFIED BY '11220020';
GRANT Egresado TO 'claudia.pena007'@'localhost';
SET DEFAULT ROLE Egresado TO 'claudia.pena007'@'localhost';
CREATE USER 'ricardo.vargas007'@'localhost' IDENTIFIED BY '11220021';
GRANT Egresado TO 'ricardo.vargas007'@'localhost';
SET DEFAULT ROLE Egresado TO 'ricardo.vargas007'@'localhost';
CREATE USER 'sara.gomez004'@'localhost' IDENTIFIED BY '11220010';
GRANT Egresado TO 'sara.gomez004'@'localhost';
SET DEFAULT ROLE Egresado TO 'sara.gomez004'@'localhost';
CREATE USER 'pedro.ruiz004'@'localhost' IDENTIFIED BY '11220011';
GRANT Egresado TO 'pedro.ruiz004'@'localhost';
SET DEFAULT ROLE Egresado TO 'pedro.ruiz004'@'localhost';
CREATE USER 'elena.hernandez004'@'localhost' IDENTIFIED BY '11220012';
GRANT Egresado TO 'elena.hernandez004'@'localhost';
SET DEFAULT ROLE Egresado TO 'elena.hernandez004'@'localhost';
CREATE USER 'beatriz.fernandez008'@'localhost' IDENTIFIED BY '11220022';
GRANT Egresado TO 'beatriz.fernandez008'@'localhost';
SET DEFAULT ROLE Egresado TO 'beatriz.fernandez008'@'localhost'; 
CREATE USER 'gustavo.guerrero008'@'localhost' IDENTIFIED BY '11220023';
GRANT Egresado TO 'gustavo.guerrero008'@'localhost';
SET DEFAULT ROLE Egresado TO 'gustavo.guerrero008'@'localhost'; 
CREATE USER 'nathalia.ruiz008'@'localhost' IDENTIFIED BY '11220024';
GRANT Egresado TO 'nathalia.ruiz008'@'localhost';
SET DEFAULT ROLE Egresado TO 'nathalia.ruiz008'@'localhost'; 
CREATE USER 'raul.perez'@'localhost' IDENTIFIED BY '11220031';
GRANT Egresado TO 'raul.perez'@'localhost';
SET DEFAULT ROLE Egresado TO 'raul.perez'@'localhost'; 
CREATE USER 'maria.gomez'@'localhost' IDENTIFIED BY '11220032';
GRANT Egresado TO 'maria.gomez'@'localhost';
SET DEFAULT ROLE Egresado TO 'maria.gomez'@'localhost'; 
CREATE USER 'carlos.rodriguez'@'localhost' IDENTIFIED BY '11220033';
GRANT Egresado TO 'carlos.rodriguez'@'localhost';
SET DEFAULT ROLE Egresado TO 'carlos.rodriguez'@'localhost'; 
CREATE USER 'laura.fernandez'@'localhost' IDENTIFIED BY '11220034';
GRANT Egresado TO 'laura.fernandez'@'localhost';
SET DEFAULT ROLE Egresado TO 'laura.fernandez'@'localhost'; 
CREATE USER 'andres.hernandez'@'localhost' IDENTIFIED BY '11220035';
GRANT Egresado TO 'andres.hernandez'@'localhost';
SET DEFAULT ROLE Egresado TO 'andres.hernandez'@'localhost'; 
CREATE USER 'paula.diaz'@'localhost' IDENTIFIED BY '11220036';
GRANT Egresado TO 'paula.diaz'@'localhost';
SET DEFAULT ROLE Egresado TO 'paula.diaz'@'localhost'; 
CREATE USER 'santiago.morales'@'localhost' IDENTIFIED BY '11220037';
GRANT Egresado TO 'santiago.morales'@'localhost';
SET DEFAULT ROLE Egresado TO 'santiago.morales'@'localhost'; 
CREATE USER 'angela.torres'@'localhost' IDENTIFIED BY '11220038';
GRANT Egresado TO 'angela.torres'@'localhost';
SET DEFAULT ROLE Egresado TO 'angela.torres'@'localhost'; 
CREATE USER 'javier.vega'@'localhost' IDENTIFIED BY '11220039';
GRANT Egresado TO 'javier.vega'@'localhost';
SET DEFAULT ROLE Egresado TO 'javier.vega'@'localhost'; 
CREATE USER 'isabel.mendoza'@'localhost' IDENTIFIED BY '11220040';
GRANT Egresado TO 'isabel.mendoza'@'localhost';
SET DEFAULT ROLE Egresado TO 'isabel.mendoza'@'localhost'; 

CREATE USER 'armando.arias'@'localhost' IDENTIFIED BY '11221100';
GRANT Conferencista TO 'armando.arias'@'localhost';
SET DEFAULT ROLE Conferencista TO 'armando.arias'@'localhost'; 
CREATE USER 'Cecilia.Orosco'@'localhost' IDENTIFIED BY '11221101';
GRANT Conferencista TO 'Cecilia.Orosco'@'localhost';
SET DEFAULT ROLE Conferencista TO 'Cecilia.Orosco'@'localhost'; 
CREATE USER 'Ana.Obregon'@'localhost' IDENTIFIED BY '11221102';
GRANT Conferencista TO 'Ana.Obregon'@'localhost';
SET DEFAULT ROLE Conferencista TO 'Ana.Obregon'@'localhost'; 

CREATE USER 'alexander.contreras'@'localhost' IDENTIFIED BY '11224400';
GRANT Coordinador_de_Sede TO 'alexander.contreras'@'localhost';
SET DEFAULT ROLE Coordinador_de_Sede TO 'alexander.contreras'@'localhost'; 
CREATE USER 'diego.amaya'@'localhost' IDENTIFIED BY '11224401';
GRANT Coordinador_de_Sede TO 'diego.amaya'@'localhost';
SET DEFAULT ROLE Coordinador_de_Sede TO 'diego.amaya'@'localhost'; 
CREATE USER 'laura.gonzalez'@'localhost' IDENTIFIED BY '11224402';
GRANT Coordinador_de_Sede TO 'laura.gonzalez'@'localhost';
SET DEFAULT ROLE Coordinador_de_Sede TO 'laura.gonzalez'@'localhost'; 
CREATE USER 'carlos.ramirez'@'localhost' IDENTIFIED BY '11224403';
GRANT Coordinador_de_Sede TO 'carlos.ramirez'@'localhost';
SET DEFAULT ROLE Coordinador_de_Sede TO 'carlos.ramirez'@'localhost'; 

FLUSH PRIVILEGES;


