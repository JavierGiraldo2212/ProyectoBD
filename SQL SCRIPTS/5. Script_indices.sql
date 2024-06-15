-- Índices para la tabla REPRESENTANTE_EMPRESA
CREATE INDEX idx_rep_emp_cedula ON Proyecto_BD.REPRESENTANTE_EMPRESA (Cedula);
CREATE INDEX idx_rep_emp_nombres ON Proyecto_BD.REPRESENTANTE_EMPRESA (Nombres);
CREATE INDEX idx_rep_emp_apellidos ON Proyecto_BD.REPRESENTANTE_EMPRESA (PrimerApellido, SegundoApellido);
SELECT*FROM idx_rep_emp_cedula;

-- Índices para la tabla EMPRESA
CREATE INDEX idx_empresa_nit ON Proyecto_BD.EMPRESA (NIT);
CREATE INDEX idx_empresa_nombre ON Proyecto_BD.EMPRESA (Nombre);
CREATE INDEX idx_empresa_campo ON Proyecto_BD.EMPRESA (Campo);
CREATE INDEX idx_empresa_rep_emp ON Proyecto_BD.EMPRESA (REPRESENTANTE_EMPRESA_Cedula);

-- Índices para la tabla OFERTA_LABORAL
CREATE INDEX idx_oferta_laboral_no ON Proyecto_BD.OFERTA_LABORAL (No_oferta);
CREATE INDEX idx_oferta_laboral_empresa ON Proyecto_BD.OFERTA_LABORAL (EMPRESA_NIT);
CREATE INDEX idx_oferta_laboral_area ON Proyecto_BD.OFERTA_LABORAL (Area);

-- Índices para la tabla SEDE
CREATE INDEX idx_sede_nombre ON Proyecto_BD.SEDE (Nombre);

-- Índices para la tabla PERSONAL_APOYO
CREATE INDEX idx_personal_apoyo_cedula ON Proyecto_BD.PERSONAL_APOYO (Cedula);
CREATE INDEX idx_personal_apoyo_nombres ON Proyecto_BD.PERSONAL_APOYO (Nombres, PrimerApellido, SegundoApellido);

-- Índices para la tabla FACULTAD
CREATE INDEX idx_facultad_id ON Proyecto_BD.FACULTAD (idFACULTAD);
CREATE INDEX idx_facultad_sede ON Proyecto_BD.FACULTAD (SEDE_idSEDE);
CREATE INDEX idx_facultad_personal_apoyo ON Proyecto_BD.FACULTAD (PERSONAL_APOYO_Cedula);

-- Índices para la tabla EVENTOS
CREATE INDEX idx_eventos_id ON Proyecto_BD.EVENTOS (ID);
CREATE INDEX idx_eventos_sede ON Proyecto_BD.EVENTOS (SEDE_idSEDE);

-- Índices para la tabla TORNEO_DEPORTIVO
CREATE INDEX idx_torneo_deportivo_evento ON Proyecto_BD.TORNEO_DEPORTIVO (EVENTO_ID);

-- Índices para la tabla EQUIPO
CREATE INDEX idx_equipo_id ON Proyecto_BD.EQUIPO (ID);
CREATE INDEX idx_equipo_torneo ON Proyecto_BD.EQUIPO (TORNEO_DEPORTIVO_EVENTO_ID);

-- Índices para la tabla EGRESADO
CREATE INDEX idx_egresado_cedula ON Proyecto_BD.EGRESADO (Cedula);
CREATE INDEX idx_egresado_facultad ON Proyecto_BD.EGRESADO (FACULTAD_idFACULTAD);
CREATE INDEX idx_egresado_nombres ON Proyecto_BD.EGRESADO (Nombre, PrimerApellido, SegundoApellido);
CREATE INDEX idx_egresado_equipo ON Proyecto_BD.EGRESADO (EQUIPO_ID);

-- Índices para la tabla CONFERENCISTA
CREATE INDEX idx_conferencista_cedula ON Proyecto_BD.CONFERENCISTA (Cedula);
CREATE INDEX idx_conferencista_nombres ON Proyecto_BD.CONFERENCISTA (Nombres, PrimerApellido, SegundoApellido);

-- Índices para la tabla EXPERIENCIA_LABORAL
CREATE INDEX idx_exp_laboral_id ON Proyecto_BD.EXPERIENCIA_LABORAL (ID);
CREATE INDEX idx_exp_laboral_egresado ON Proyecto_BD.EXPERIENCIA_LABORAL (EGRESADO_Cedula);
CREATE INDEX idx_exp_laboral_conferencista ON Proyecto_BD.EXPERIENCIA_LABORAL (CONFERENCISTA_Cedula);
CREATE INDEX idx_exp_laboral_empresa ON Proyecto_BD.EXPERIENCIA_LABORAL (EMPRESA_NIT);

-- Índices para la tabla IDIOMA
CREATE INDEX idx_idioma_id ON Proyecto_BD.IDIOMA (ID_Idioma);

-- Índices para la tabla TELEFONO
CREATE INDEX idx_telefono_egresado ON Proyecto_BD.TELEFONO (EGRESADO_Cedula);

-- Índices para la tabla FORMACION_ACADEMICA
CREATE INDEX idx_formacion_acad_acta ON Proyecto_BD.FORMACION_ACADEMICA (ActaGrado);
CREATE INDEX idx_formacion_acad_egresado ON Proyecto_BD.FORMACION_ACADEMICA (EGRESADO_Cedula);
CREATE INDEX idx_formacion_acad_conferencista ON Proyecto_BD.FORMACION_ACADEMICA (CONFERENCISTA_Cedula);

-- Índices para la tabla DIALOGOS_EGRESADOS
CREATE INDEX idx_dialogos_egresados_evento ON Proyecto_BD.DIALOGOS_EGRESADOS (EVENTO_ID);

-- Índices para la tabla CATEDRA
CREATE INDEX idx_catedra_evento ON Proyecto_BD.CATEDRA (EVENTO_ID);

-- Índices para la tabla COORDINADOR
CREATE INDEX idx_coordinador_cedula ON Proyecto_BD.COORDINADOR (Cedula);
CREATE INDEX idx_coordinador_sede ON Proyecto_BD.COORDINADOR (SEDE_idSEDE);

-- Índices para la tabla EGRESADO_ASISTE_CATEDRA
CREATE INDEX idx_egr_asis_catedra_egresado ON Proyecto_BD.EGRESADO_ASISTE_CATEDRA (EGRESADO_Cedula);
CREATE INDEX idx_egr_asis_catedra_catedra ON Proyecto_BD.EGRESADO_ASISTE_CATEDRA (CATEDRA_EVENTO_ID);

-- Índices para la tabla EGRESADO_DICTA_CATEDRA
CREATE INDEX idx_egr_dicta_catedra_egresado ON Proyecto_BD.EGRESADO_DICTA_CATEDRA (EGRESADO_Cedula);
CREATE INDEX idx_egr_dicta_catedra_catedra ON Proyecto_BD.EGRESADO_DICTA_CATEDRA (CATEDRA_EVENTO_ID);

-- Índices para la tabla EGRESADO_ASISTE_DIALOGOS_EGRESADOS
CREATE INDEX idx_egr_asis_dialogos_egresado ON Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS (EGRESADO_Cedula);
CREATE INDEX idx_egr_asis_dialogos_dialogos ON Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS (DIALOGOS_EGRESADOS_EVENTO_ID);

-- Índices para la tabla EGRESADO_APLICA_OFERTA_LABORAL
CREATE INDEX idx_egr_aplica_oferta_egresado ON Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL (EGRESADO_Cedula);
CREATE INDEX idx_egr_aplica_oferta_oferta ON Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL (OFERTA_LABORAL_No_oferta);

-- Índices para la tabla EGRESADO_HABLA_IDIOMA
CREATE INDEX idx_egr_habla_idioma_egresado ON Proyecto_BD.EGRESADO_HABLA_IDIOMA (EGRESADO_Cedula);
CREATE INDEX idx_egr_habla_idioma_idioma ON Proyecto_BD.EGRESADO_HABLA_IDIOMA (IDIOMA_ID_Idioma);
-- Índices para la tabla CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
CREATE INDEX idx_conf_dicta_dialogos_conf ON Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS (CONFERENCISTA_Cedula);
CREATE INDEX idx_conf_dicta_dialogos_dialogos ON Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS (DIALOGOS_EGRESADOS_EVENTO_ID);