USE Proyecto_BD;

-- -----------------------------------------------------
-- Creación del historial para representante de empresa
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_representante_empresa;
CREATE TABLE Proyecto_BD.historial_representante_empresa (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula INT,
    nombres_eliminado VARCHAR(20) DEFAULT NULL,
    nombres_insertado VARCHAR(20) DEFAULT NULL,
    primer_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    primer_apellido_insertado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_insertado VARCHAR(20) DEFAULT NULL,
    cargo_eliminado VARCHAR(45) DEFAULT NULL,
    cargo_insertado VARCHAR(45) DEFAULT NULL,
    correo_eliminado VARCHAR(45) DEFAULT NULL,
    correo_insertado VARCHAR(45) DEFAULT NULL,
    telefono_eliminado VARCHAR(15) DEFAULT NULL,
    telefono_insertado VARCHAR(15) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  -- Campo para el usuario que hizo la modificación
);

-- Creación trigger insert

DROP TRIGGER IF EXISTS representante_empresa_insert;

DELIMITER $$

CREATE TRIGGER representante_empresa_insert
AFTER INSERT ON Proyecto_BD.REPRESENTANTE_EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_representante_empresa (
        fecha_cambio, accion, cedula, nombres_insertado, primer_apellido_insertado, 
        segundo_apellido_insertado, cargo_insertado, correo_insertado, telefono_insertado, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.Nombres, NEW.PrimerApellido, 
        NEW.SegundoApellido, NEW.Cargo, NEW.Correo, NEW.Telefono, USER()
    );
END $$

DELIMITER ;


-- Creación trigger update

DROP TRIGGER IF EXISTS representante_empresa_update;

DELIMITER $$

CREATE TRIGGER representante_empresa_update
AFTER UPDATE ON Proyecto_BD.REPRESENTANTE_EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_representante_empresa (
        fecha_cambio, accion, cedula, 
        nombres_eliminado, nombres_insertado, 
        primer_apellido_eliminado, primer_apellido_insertado,
        segundo_apellido_eliminado, segundo_apellido_insertado,
        cargo_eliminado, cargo_insertado,
        correo_eliminado, correo_insertado,
        telefono_eliminado, telefono_insertado, usuario
    )
    VALUES (
        NOW(), 'UPDATE', OLD.Cedula, 
        OLD.Nombres, NEW.Nombres, 
        OLD.PrimerApellido, NEW.PrimerApellido,
        OLD.SegundoApellido, NEW.SegundoApellido,
        OLD.Cargo, NEW.Cargo,
        OLD.Correo, NEW.Correo,
        OLD.Telefono, NEW.Telefono, USER()
    );
END $$

DELIMITER ;

-- Creación trigger insert

DROP TRIGGER IF EXISTS representante_empresa_delete;

DELIMITER $$

CREATE TRIGGER representante_empresa_delete
AFTER DELETE ON Proyecto_BD.REPRESENTANTE_EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_representante_empresa (
        fecha_cambio, accion, cedula, 
        nombres_eliminado, 
        primer_apellido_eliminado,
        segundo_apellido_eliminado,
        cargo_eliminado,
        correo_eliminado,
        telefono_eliminado, usuario
    )
    VALUES (
        NOW(), 'DELETE',
        OLD.Cedula, 
        OLD.Nombres, 
        OLD.PrimerApellido,
        OLD.SegundoApellido,
        OLD.Cargo,
        OLD.Correo,
        OLD.Telefono, USER()
    );
END $$

DELIMITER ;


-- -----------------------------------------------------
-- Creación del historial para empresa
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_empresa;
CREATE TABLE Proyecto_BD.historial_empresa (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    nit INT,
    nombre_eliminado VARCHAR(20) DEFAULT NULL,
    nombre_insertado VARCHAR(20) DEFAULT NULL,
    descripcion_eliminada VARCHAR(50) DEFAULT NULL,
    descripcion_insertada VARCHAR(50) DEFAULT NULL,
    campo_eliminado VARCHAR(20) DEFAULT NULL,
    campo_insertado VARCHAR(20) DEFAULT NULL,
    telefono_eliminado VARCHAR(15) DEFAULT NULL,
    telefono_insertado VARCHAR(15) DEFAULT NULL,
    direccion_eliminada VARCHAR(45) DEFAULT NULL,
    direccion_insertada VARCHAR(45) DEFAULT NULL,
    correo_electronico_eliminado VARCHAR(50) DEFAULT NULL,
    correo_electronico_insertado VARCHAR(50) DEFAULT NULL,
    pagina_web_eliminada VARCHAR(45) DEFAULT NULL,
    pagina_web_insertada VARCHAR(45) DEFAULT NULL,
    representante_cedula_eliminada INT DEFAULT NULL,
    representante_cedula_insertada INT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  -- Campo para el usuario que hizo la modificación
);

-- Trigger para INSERT en EMPRESA

DROP TRIGGER IF EXISTS empresa_insert;

DELIMITER $$

CREATE TRIGGER empresa_insert
AFTER INSERT ON Proyecto_BD.EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_empresa (
        fecha_cambio, accion, nit, nombre_insertado, descripcion_insertada,
        campo_insertado, telefono_insertado, direccion_insertada,
        correo_electronico_insertado, pagina_web_insertada,
        representante_cedula_insertada, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.NIT, NEW.Nombre, NEW.Descripcion,
        NEW.Campo, NEW.Telefono, NEW.Direccion,
        NEW.CorreoElectronico, NEW.PaginaWeb,
        NEW.REPRESENTANTE_EMPRESA_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EMPRESA

DROP TRIGGER IF EXISTS empresa_update;

DELIMITER $$

CREATE TRIGGER empresa_update
AFTER UPDATE ON Proyecto_BD.EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_empresa (
        fecha_cambio, accion, nit,
        nombre_eliminado, nombre_insertado,
        descripcion_eliminada, descripcion_insertada,
        campo_eliminado, campo_insertado,
        telefono_eliminado, telefono_insertado,
        direccion_eliminada, direccion_insertada,
        correo_electronico_eliminado, correo_electronico_insertado,
        pagina_web_eliminada, pagina_web_insertada,
        representante_cedula_eliminada, representante_cedula_insertada,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.NIT,
        OLD.Nombre, NEW.Nombre,
        OLD.Descripcion, NEW.Descripcion,
        OLD.Campo, NEW.Campo,
        OLD.Telefono, NEW.Telefono,
        OLD.Direccion, NEW.Direccion,
        OLD.CorreoElectronico, NEW.CorreoElectronico,
        OLD.PaginaWeb, NEW.PaginaWeb,
        OLD.REPRESENTANTE_EMPRESA_Cedula, NEW.REPRESENTANTE_EMPRESA_Cedula,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EMPRESA

DROP TRIGGER IF EXISTS empresa_delete;

DELIMITER $$

CREATE TRIGGER empresa_delete
AFTER DELETE ON Proyecto_BD.EMPRESA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_empresa (
        fecha_cambio, accion, nit,
        nombre_eliminado, descripcion_eliminada,
        campo_eliminado, telefono_eliminado,
        direccion_eliminada, correo_electronico_eliminado,
        pagina_web_eliminada, representante_cedula_eliminada,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.NIT,
        OLD.Nombre, OLD.Descripcion,
        OLD.Campo, OLD.Telefono,
        OLD.Direccion, OLD.CorreoElectronico,
        OLD.PaginaWeb, OLD.REPRESENTANTE_EMPRESA_Cedula,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para oferta laboral
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_oferta_laboral;
CREATE TABLE Proyecto_BD.historial_oferta_laboral (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    no_oferta INT,
    empresa_nit_eliminado INT DEFAULT NULL,
    empresa_nit_insertado INT DEFAULT NULL,
    estado_eliminado ENUM('En definicion', 'Convocatoria abierta', 'En seleccion', 'Finalizada', 'Cancelada') DEFAULT NULL,
    estado_insertado ENUM('En definicion', 'Convocatoria abierta', 'En seleccion', 'Finalizada', 'Cancelada') DEFAULT NULL,
    salario_eliminado INT DEFAULT NULL,
    salario_insertado INT DEFAULT NULL,
    exp_requerida_eliminada INT DEFAULT NULL,
    exp_requerida_insertada INT DEFAULT NULL,
    area_eliminada VARCHAR(40) DEFAULT NULL,
    area_insertada VARCHAR(40) DEFAULT NULL,
    tipo_contrato_eliminado VARCHAR(40) DEFAULT NULL,
    tipo_contrato_insertado VARCHAR(40) DEFAULT NULL,
    fecha_publicacion_eliminada DATE DEFAULT NULL,
    fecha_publicacion_insertada DATE DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL 
);

-- Trigger para INSERT en OFERTA_LABORAL
DROP TRIGGER IF EXISTS oferta_laboral_insert;

DELIMITER $$

CREATE TRIGGER oferta_laboral_insert
AFTER INSERT ON Proyecto_BD.OFERTA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_oferta_laboral (
        fecha_cambio, accion, no_oferta, empresa_nit_insertado,
        estado_insertado, salario_insertado, exp_requerida_insertada,
        area_insertada, tipo_contrato_insertado, fecha_publicacion_insertada,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.No_oferta, NEW.EMPRESA_NIT,
        NEW.Estado, NEW.Salario, NEW.ExpRequerida,
        NEW.Area, NEW.TipoContrato, NEW.FechaPublicacion,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en OFERTA_LABORAL
DROP TRIGGER IF EXISTS oferta_laboral_update;

DELIMITER $$

CREATE TRIGGER oferta_laboral_update
AFTER UPDATE ON Proyecto_BD.OFERTA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_oferta_laboral (
        fecha_cambio, accion, no_oferta,
        empresa_nit_eliminado, empresa_nit_insertado,
        estado_eliminado, estado_insertado,
        salario_eliminado, salario_insertado,
        exp_requerida_eliminada, exp_requerida_insertada,
        area_eliminada, area_insertada,
        tipo_contrato_eliminado, tipo_contrato_insertado,
        fecha_publicacion_eliminada, fecha_publicacion_insertada,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.No_oferta,
        OLD.EMPRESA_NIT, NEW.EMPRESA_NIT,
        OLD.Estado, NEW.Estado,
        OLD.Salario, NEW.Salario,
        OLD.ExpRequerida, NEW.ExpRequerida,
        OLD.Area, NEW.Area,
        OLD.TipoContrato, NEW.TipoContrato,
        OLD.FechaPublicacion, NEW.FechaPublicacion,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en OFERTA_LABORAL
DROP TRIGGER IF EXISTS oferta_laboral_delete;

DELIMITER $$

CREATE TRIGGER oferta_laboral_delete
AFTER DELETE ON Proyecto_BD.OFERTA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_oferta_laboral (
        fecha_cambio, accion, no_oferta,
        empresa_nit_eliminado,
        estado_eliminado,
        salario_eliminado,
        exp_requerida_eliminada,
        area_eliminada,
        tipo_contrato_eliminado,
        fecha_publicacion_eliminada,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.No_oferta,
        OLD.EMPRESA_NIT,
        OLD.Estado,
        OLD.Salario,
        OLD.ExpRequerida,
        OLD.Area,
        OLD.TipoContrato,
        OLD.FechaPublicacion,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para sede
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_sede;
CREATE TABLE Proyecto_BD.historial_sede (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    idsede INT,
    nombre_eliminado VARCHAR(45) DEFAULT NULL,
    nombre_insertado VARCHAR(45) DEFAULT NULL,
    correo_administracion_eliminado VARCHAR(45) DEFAULT NULL,
    correo_administracion_insertado VARCHAR(45) DEFAULT NULL,
    pbx_eliminado INT DEFAULT NULL,
    pbx_insertado INT DEFAULT NULL,
    ext_eliminada INT DEFAULT NULL,
    ext_insertada INT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en SEDE
DROP TRIGGER IF EXISTS sede_insert;

DELIMITER $$

CREATE TRIGGER sede_insert
AFTER INSERT ON Proyecto_BD.SEDE
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_sede (
        fecha_cambio, accion, idsede, nombre_insertado,
        correo_administracion_insertado, pbx_insertado, ext_insertada,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.idSEDE, NEW.Nombre,
        NEW.CorreoAdministracion, NEW.PBX, NEW.EXT,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en SEDE
DROP TRIGGER IF EXISTS sede_update;

DELIMITER $$

CREATE TRIGGER sede_update
AFTER UPDATE ON Proyecto_BD.SEDE
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_sede (
        fecha_cambio, accion, idsede,
        nombre_eliminado, nombre_insertado,
        correo_administracion_eliminado, correo_administracion_insertado,
        pbx_eliminado, pbx_insertado,
        ext_eliminada, ext_insertada,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.idSEDE,
        OLD.Nombre, NEW.Nombre,
        OLD.CorreoAdministracion, NEW.CorreoAdministracion,
        OLD.PBX, NEW.PBX,
        OLD.EXT, NEW.EXT,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en SEDE
DROP TRIGGER IF EXISTS sede_delete;

DELIMITER $$

CREATE TRIGGER sede_delete
AFTER DELETE ON Proyecto_BD.SEDE
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_sede (
        fecha_cambio, accion, idsede,
        nombre_eliminado,
        correo_administracion_eliminado,
        pbx_eliminado,
        ext_eliminada,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.idSEDE,
        OLD.Nombre,
        OLD.CorreoAdministracion,
        OLD.PBX,
        OLD.EXT,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para personal de apoyo
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_personal_apoyo;
CREATE TABLE Proyecto_BD.historial_personal_apoyo (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula BIGINT,
    nombres_eliminados VARCHAR(45) DEFAULT NULL,
    nombres_insertados VARCHAR(45) DEFAULT NULL,
    primer_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    primer_apellido_insertado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_insertado VARCHAR(20) DEFAULT NULL,
    correo_eliminado VARCHAR(45) DEFAULT NULL,
    correo_insertado VARCHAR(45) DEFAULT NULL,
    telefono_eliminado BIGINT DEFAULT NULL,
    telefono_insertado BIGINT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en PERSONAL_APOYO
DROP TRIGGER IF EXISTS personal_apoyo_insert;

DELIMITER $$

CREATE TRIGGER personal_apoyo_insert
AFTER INSERT ON Proyecto_BD.PERSONAL_APOYO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_personal_apoyo (
        fecha_cambio, accion, cedula, nombres_insertados,
        primer_apellido_insertado, segundo_apellido_insertado,
        correo_insertado, telefono_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.Nombres,
        NEW.PrimerApellido, NEW.SegundoApellido,
        NEW.Correo, NEW.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en PERSONAL_APOYO
DROP TRIGGER IF EXISTS personal_apoyo_update;

DELIMITER $$

CREATE TRIGGER personal_apoyo_update
AFTER UPDATE ON Proyecto_BD.PERSONAL_APOYO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_personal_apoyo (
        fecha_cambio, accion, cedula,
        nombres_eliminados, nombres_insertados,
        primer_apellido_eliminado, primer_apellido_insertado,
        segundo_apellido_eliminado, segundo_apellido_insertado,
        correo_eliminado, correo_insertado,
        telefono_eliminado, telefono_insertado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.Cedula,
        OLD.Nombres, NEW.Nombres,
        OLD.PrimerApellido, NEW.PrimerApellido,
        OLD.SegundoApellido, NEW.SegundoApellido,
        OLD.Correo, NEW.Correo,
        OLD.Telefono, NEW.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en PERSONAL_APOYO
DROP TRIGGER IF EXISTS personal_apoyo_delete;

DELIMITER $$

CREATE TRIGGER personal_apoyo_delete
AFTER DELETE ON Proyecto_BD.PERSONAL_APOYO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_personal_apoyo (
        fecha_cambio, accion, cedula,
        nombres_eliminados,
        primer_apellido_eliminado,
        segundo_apellido_eliminado,
        correo_eliminado,
        telefono_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.Cedula,
        OLD.Nombres,
        OLD.PrimerApellido,
        OLD.SegundoApellido,
        OLD.Correo,
        OLD.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para facultad
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_facultad;
CREATE TABLE Proyecto_BD.historial_facultad (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    idfacultad INT,
    sede_id_eliminada INT DEFAULT NULL,
    sede_id_insertada INT DEFAULT NULL,
    nombre_eliminado VARCHAR(50) DEFAULT NULL,
    nombre_insertado VARCHAR(50) DEFAULT NULL,
    oficina_eliminada VARCHAR(45) DEFAULT NULL,
    oficina_insertada VARCHAR(45) DEFAULT NULL,
    correo_administracion_eliminado VARCHAR(45) DEFAULT NULL,
    correo_administracion_insertado VARCHAR(45) DEFAULT NULL,
    pbx_eliminado INT DEFAULT NULL,
    pbx_insertado INT DEFAULT NULL,
    ext_eliminada INT DEFAULT NULL,
    ext_insertada INT DEFAULT NULL,
    personal_apoyo_cedula_eliminada BIGINT DEFAULT NULL,
    personal_apoyo_cedula_insertada BIGINT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en FACULTAD
DROP TRIGGER IF EXISTS facultad_insert;

DELIMITER $$

CREATE TRIGGER facultad_insert
AFTER INSERT ON Proyecto_BD.FACULTAD
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_facultad (
        fecha_cambio, accion, idfacultad, sede_id_insertada,
        nombre_insertado, oficina_insertada,
        correo_administracion_insertado, pbx_insertado, ext_insertada,
        personal_apoyo_cedula_insertada,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.idFACULTAD, NEW.SEDE_idSEDE,
        NEW.Nombre, NEW.Oficina,
        NEW.CorreoAdministracion, NEW.PBX, NEW.EXT,
        NEW.PERSONAL_APOYO_Cedula,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en FACULTAD
DROP TRIGGER IF EXISTS facultad_update;

DELIMITER $$

CREATE TRIGGER facultad_update
AFTER UPDATE ON Proyecto_BD.FACULTAD
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_facultad (
        fecha_cambio, accion, idfacultad,
        sede_id_eliminada, sede_id_insertada,
        nombre_eliminado, nombre_insertado,
        oficina_eliminada, oficina_insertada,
        correo_administracion_eliminado, correo_administracion_insertado,
        pbx_eliminado, pbx_insertado,
        ext_eliminada, ext_insertada,
        personal_apoyo_cedula_eliminada, personal_apoyo_cedula_insertada,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.idFACULTAD,
        OLD.SEDE_idSEDE, NEW.SEDE_idSEDE,
        OLD.Nombre, NEW.Nombre,
        OLD.Oficina, NEW.Oficina,
        OLD.CorreoAdministracion, NEW.CorreoAdministracion,
        OLD.PBX, NEW.PBX,
        OLD.EXT, NEW.EXT,
        OLD.PERSONAL_APOYO_Cedula, NEW.PERSONAL_APOYO_Cedula,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en FACULTAD
DROP TRIGGER IF EXISTS facultad_delete;

DELIMITER $$

CREATE TRIGGER facultad_delete
AFTER DELETE ON Proyecto_BD.FACULTAD
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_facultad (
        fecha_cambio, accion, idfacultad,
        sede_id_eliminada,
        nombre_eliminado,
        oficina_eliminada,
        correo_administracion_eliminado,
        pbx_eliminado,
        ext_eliminada,
        personal_apoyo_cedula_eliminada,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.idFACULTAD,
        OLD.SEDE_idSEDE,
        OLD.Nombre,
        OLD.Oficina,
        OLD.CorreoAdministracion,
        OLD.PBX,
        OLD.EXT,
        OLD.PERSONAL_APOYO_Cedula,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para eventos
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_eventos;
CREATE TABLE Proyecto_BD.historial_eventos (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    sede_id_eliminada INT DEFAULT NULL,
    sede_id_insertada INT DEFAULT NULL,
    nombre_eliminado VARCHAR(40) DEFAULT NULL,
    nombre_insertado VARCHAR(40) DEFAULT NULL,
    descripcion_eliminada VARCHAR(100) DEFAULT NULL,
    descripcion_insertada VARCHAR(100) DEFAULT NULL,
    fecha_eliminada DATE DEFAULT NULL,
    fecha_insertada DATE DEFAULT NULL,
    hora_eliminada TIME DEFAULT NULL,
    hora_insertada TIME DEFAULT NULL,
    lugar_plataforma_eliminado VARCHAR(45) DEFAULT NULL,
    lugar_plataforma_insertado VARCHAR(45) DEFAULT NULL,
    max_asistentes_eliminado VARCHAR(45) DEFAULT NULL,
    max_asistentes_insertado VARCHAR(45) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EVENTOS
DROP TRIGGER IF EXISTS eventos_insert;

DELIMITER $$

CREATE TRIGGER eventos_insert
AFTER INSERT ON Proyecto_BD.EVENTOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_eventos (
        fecha_cambio, accion, id_evento, sede_id_insertada,
        nombre_insertado, descripcion_insertada,
        fecha_insertada, hora_insertada,
        lugar_plataforma_insertado, max_asistentes_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.ID, NEW.SEDE_idSEDE,
        NEW.Nombre, NEW.Descripcion,
        NEW.Fecha, NEW.Hora,
        NEW.Lugar_plataforma, NEW.MAX_Asistentes,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EVENTOS
DROP TRIGGER IF EXISTS eventos_update;

DELIMITER $$

CREATE TRIGGER eventos_update
AFTER UPDATE ON Proyecto_BD.EVENTOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_eventos (
        fecha_cambio, accion, id_evento,
        sede_id_eliminada, sede_id_insertada,
        nombre_eliminado, nombre_insertado,
        descripcion_eliminada, descripcion_insertada,
        fecha_eliminada, fecha_insertada,
        hora_eliminada, hora_insertada,
        lugar_plataforma_eliminado, lugar_plataforma_insertado,
        max_asistentes_eliminado, max_asistentes_insertado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.ID,
        OLD.SEDE_idSEDE, NEW.SEDE_idSEDE,
        OLD.Nombre, NEW.Nombre,
        OLD.Descripcion, NEW.Descripcion,
        OLD.Fecha, NEW.Fecha,
        OLD.Hora, NEW.Hora,
        OLD.Lugar_plataforma, NEW.Lugar_plataforma,
        OLD.MAX_Asistentes, NEW.MAX_Asistentes,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EVENTOS
DROP TRIGGER IF EXISTS eventos_delete;

DELIMITER $$

CREATE TRIGGER eventos_delete
AFTER DELETE ON Proyecto_BD.EVENTOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_eventos (
        fecha_cambio, accion, id_evento,
        sede_id_eliminada,
        nombre_eliminado,
        descripcion_eliminada,
        fecha_eliminada,
        hora_eliminada,
        lugar_plataforma_eliminado,
        max_asistentes_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.ID,
        OLD.SEDE_idSEDE,
        OLD.Nombre,
        OLD.Descripcion,
        OLD.Fecha,
        OLD.Hora,
        OLD.Lugar_plataforma,
        OLD.MAX_Asistentes,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para torneo deportivo
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_torneo_deportivo;
CREATE TABLE Proyecto_BD.historial_torneo_deportivo (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    evento_id INT,
    tipo_eliminado VARCHAR(15) DEFAULT NULL,
    tipo_insertado VARCHAR(15) DEFAULT NULL,
    duracion_eliminada INT DEFAULT NULL,
    duracion_insertada INT DEFAULT NULL,
    sexo_eliminado CHAR(3) DEFAULT NULL,
    sexo_insertado CHAR(3) DEFAULT NULL,
    premio_eliminado VARCHAR(45) DEFAULT NULL,
    premio_insertado VARCHAR(45) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en TORNEO_DEPORTIVO
DROP TRIGGER IF EXISTS torneo_deportivo_insert;

DELIMITER $$

CREATE TRIGGER torneo_deportivo_insert
AFTER INSERT ON Proyecto_BD.TORNEO_DEPORTIVO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_torneo_deportivo (
        fecha_cambio, accion, evento_id,
        tipo_insertado, duracion_insertada,
        sexo_insertado, premio_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.EVENTO_ID,
        NEW.Tipo, NEW.Duracion,
        NEW.Sexo, NEW.Premio,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en TORNEO_DEPORTIVO
DROP TRIGGER IF EXISTS torneo_deportivo_update;

DELIMITER $$

CREATE TRIGGER torneo_deportivo_update
AFTER UPDATE ON Proyecto_BD.TORNEO_DEPORTIVO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_torneo_deportivo (
        fecha_cambio, accion, evento_id,
        tipo_eliminado, tipo_insertado,
        duracion_eliminada, duracion_insertada,
        sexo_eliminado, sexo_insertado,
        premio_eliminado, premio_insertado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.EVENTO_ID,
        OLD.Tipo, NEW.Tipo,
        OLD.Duracion, NEW.Duracion,
        OLD.Sexo, NEW.Sexo,
        OLD.Premio, NEW.Premio,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en TORNEO_DEPORTIVO
DROP TRIGGER IF EXISTS torneo_deportivo_delete;

DELIMITER $$

CREATE TRIGGER torneo_deportivo_delete
AFTER DELETE ON Proyecto_BD.TORNEO_DEPORTIVO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_torneo_deportivo (
        fecha_cambio, accion, evento_id,
        tipo_eliminado, duracion_eliminada,
        sexo_eliminado, premio_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.EVENTO_ID,
        OLD.Tipo, OLD.Duracion,
        OLD.Sexo, OLD.Premio,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para equipos
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_equipo;
CREATE TABLE Proyecto_BD.historial_equipo (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
	id_H INT PRIMARY KEY AUTO_INCREMENT,
    id INT,
    torneo_deportivo_evento_id INT,
    nombre_eliminado VARCHAR(20) DEFAULT NULL,
    nombre_insertado VARCHAR(20) DEFAULT NULL,
    clasificacion_eliminada VARCHAR(20) DEFAULT NULL,
    clasificacion_insertada VARCHAR(20) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EQUIPO
DROP TRIGGER IF EXISTS equipo_insert;

DELIMITER $$

CREATE TRIGGER equipo_insert
AFTER INSERT ON Proyecto_BD.EQUIPO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_equipo (
        fecha_cambio, accion, id, torneo_deportivo_evento_id,
        nombre_insertado, clasificacion_insertada,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.ID, NEW.TORNEO_DEPORTIVO_EVENTO_ID,
        NEW.Nombre, NEW.Clasificacion,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EQUIPO
DROP TRIGGER IF EXISTS equipo_update;

DELIMITER $$

CREATE TRIGGER equipo_update
AFTER UPDATE ON Proyecto_BD.EQUIPO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_equipo (
        fecha_cambio, accion, id, torneo_deportivo_evento_id,
        nombre_eliminado, nombre_insertado,
        clasificacion_eliminada, clasificacion_insertada,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.ID, NEW.TORNEO_DEPORTIVO_EVENTO_ID,
        OLD.Nombre, NEW.Nombre,
        OLD.Clasificacion, NEW.Clasificacion,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EQUIPO
DROP TRIGGER IF EXISTS equipo_delete;

DELIMITER $$

CREATE TRIGGER equipo_delete
AFTER DELETE ON Proyecto_BD.EQUIPO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_equipo (
        fecha_cambio, accion, id, torneo_deportivo_evento_id,
        nombre_eliminado, clasificacion_eliminada,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.ID, OLD.TORNEO_DEPORTIVO_EVENTO_ID,
        OLD.Nombre, OLD.Clasificacion,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresado
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado;
CREATE TABLE Proyecto_BD.historial_egresado (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula BIGINT,
    facultad_id_eliminada INT DEFAULT NULL,
    facultad_id_insertada INT DEFAULT NULL,
    fecha_nacimiento_eliminada DATE DEFAULT NULL,
    fecha_nacimiento_insertada DATE DEFAULT NULL,
    nombre_eliminado VARCHAR(45) DEFAULT NULL,
    nombre_insertado VARCHAR(45) DEFAULT NULL,
    primer_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    primer_apellido_insertado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_insertado VARCHAR(20) DEFAULT NULL,
    direccion_eliminada VARCHAR(45) DEFAULT NULL,
    direccion_insertada VARCHAR(45) DEFAULT NULL,
    ciudad_eliminada VARCHAR(20) DEFAULT NULL,
    ciudad_insertada VARCHAR(20) DEFAULT NULL,
    pais_eliminado VARCHAR(20) DEFAULT NULL,
    pais_insertado VARCHAR(20) DEFAULT NULL,
    correo_electronico_eliminado VARCHAR(50) DEFAULT NULL,
    correo_electronico_insertado VARCHAR(50) DEFAULT NULL,
    contrasenia_eliminada VARCHAR(45) DEFAULT NULL,
    contrasenia_insertada VARCHAR(45) DEFAULT NULL,
    genero_eliminado CHAR(1) DEFAULT NULL,
    genero_insertado CHAR(1) DEFAULT NULL,
    grupo_etnico_eliminado VARCHAR(20) DEFAULT NULL,
    grupo_etnico_insertado VARCHAR(20) DEFAULT NULL,
    equipo_id_eliminado INT DEFAULT NULL,
    equipo_id_insertado INT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL 
);

-- Trigger para INSERT en EGRESADO
DROP TRIGGER IF EXISTS egresado_insert;

DELIMITER $$

CREATE TRIGGER egresado_insert
AFTER INSERT ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_insertada,
        fecha_nacimiento_insertada, nombre_insertado,
        primer_apellido_insertado, segundo_apellido_insertado,
        direccion_insertada, ciudad_insertada, pais_insertado,
        correo_electronico_insertado, contrasenia_insertada,
        genero_insertado, grupo_etnico_insertado, equipo_id_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.FACULTAD_idFACULTAD,
        NEW.FechaNacimiento, NEW.Nombre, NEW.PrimerApellido,
        NEW.SegundoApellido, NEW.Direccion, NEW.Ciudad,
        NEW.Pais, NEW.CorreoElectronico, NEW.Contrasenia,
        NEW.Genero, NEW.GrupoEtnico, NEW.EQUIPO_ID,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EGRESADO
DROP TRIGGER IF EXISTS egresado_update;

DELIMITER $$

CREATE TRIGGER egresado_update
AFTER UPDATE ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_eliminada, facultad_id_insertada,
        fecha_nacimiento_eliminada, fecha_nacimiento_insertada,
        nombre_eliminado, nombre_insertado,
        primer_apellido_eliminado, primer_apellido_insertado,
        segundo_apellido_eliminado, segundo_apellido_insertado,
        direccion_eliminada, direccion_insertada,
        ciudad_eliminada, ciudad_insertada,
        pais_eliminado, pais_insertado,
        correo_electronico_eliminado, correo_electronico_insertado,
        contrasenia_eliminada, contrasenia_insertada,
        genero_eliminado, genero_insertado,
        grupo_etnico_eliminado, grupo_etnico_insertado,
        equipo_id_eliminado, equipo_id_insertado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.Cedula,
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
        OLD.EQUIPO_ID, NEW.EQUIPO_ID,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO
DROP TRIGGER IF EXISTS egresado_delete;

DELIMITER $$

CREATE TRIGGER egresado_delete
AFTER DELETE ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_eliminada,
        fecha_nacimiento_eliminada, nombre_eliminado,
        primer_apellido_eliminado, segundo_apellido_eliminado,
        direccion_eliminada, ciudad_eliminada, pais_eliminado,
        correo_electronico_eliminado, contrasenia_eliminada,
        genero_eliminado, grupo_etnico_eliminado, equipo_id_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.Cedula, OLD.FACULTAD_idFACULTAD,
        OLD.FechaNacimiento, OLD.Nombre, OLD.PrimerApellido,
        OLD.SegundoApellido, OLD.Direccion, OLD.Ciudad,
        OLD.Pais, OLD.CorreoElectronico, OLD.Contrasenia,
        OLD.Genero, OLD.GrupoEtnico, OLD.EQUIPO_ID,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para conferencista
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_conferencista;
CREATE TABLE Proyecto_BD.historial_conferencista (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula BIGINT,
    nombre_eliminado VARCHAR(45) DEFAULT NULL,
    nombre_insertado VARCHAR(45) DEFAULT NULL,
    primer_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    primer_apellido_insertado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_eliminado VARCHAR(20) DEFAULT NULL,
    segundo_apellido_insertado VARCHAR(20) DEFAULT NULL,
    correo_eliminado VARCHAR(45) DEFAULT NULL,
    correo_insertado VARCHAR(45) DEFAULT NULL,
    telefono_eliminado BIGINT DEFAULT NULL,
    telefono_insertado BIGINT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en CONFERENCISTA
DROP TRIGGER IF EXISTS conferencista_insert;

DELIMITER $$

CREATE TRIGGER conferencista_insert
AFTER INSERT ON Proyecto_BD.CONFERENCISTA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_conferencista (
        fecha_cambio, accion, cedula, nombre_insertado,
        primer_apellido_insertado, segundo_apellido_insertado,
        correo_insertado, telefono_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.Nombres,
        NEW.PrimerApellido, NEW.SegundoApellido,
        NEW.Correo, NEW.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para INSERT en CONFERENCISTA
DROP TRIGGER IF EXISTS conferencista_insert;

DELIMITER $$

CREATE TRIGGER conferencista_insert
AFTER INSERT ON Proyecto_BD.CONFERENCISTA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_conferencista (
        fecha_cambio, accion, cedula, nombre_insertado,
        primer_apellido_insertado, segundo_apellido_insertado,
        correo_insertado, telefono_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.Nombres,
        NEW.PrimerApellido, NEW.SegundoApellido,
        NEW.Correo, NEW.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en CONFERENCISTA
DROP TRIGGER IF EXISTS conferencista_delete;

DELIMITER $$

CREATE TRIGGER conferencista_delete
AFTER DELETE ON Proyecto_BD.CONFERENCISTA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_conferencista (
        fecha_cambio, accion, cedula,
        nombre_eliminado, primer_apellido_eliminado,
        segundo_apellido_eliminado, correo_eliminado,
        telefono_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.Cedula,
        OLD.Nombres, OLD.PrimerApellido,
        OLD.SegundoApellido, OLD.Correo,
        OLD.Telefono,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para experiencia laboral
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_experiencia_laboral;
CREATE TABLE Proyecto_BD.historial_experiencia_laboral (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    id INT,
    egresado_cedula BIGINT,
    conferencista_cedula BIGINT,
    situacion_actual_insertada VARCHAR(20) DEFAULT NULL,
    situacion_actual_eliminada VARCHAR(20) DEFAULT NULL,
    sector_laboral_actual_insertado VARCHAR(45) DEFAULT NULL,
    sector_laboral_actual_eliminado VARCHAR(45) DEFAULT NULL,
    cargo_insertado VARCHAR(40) DEFAULT NULL,
    cargo_eliminado VARCHAR(40) DEFAULT NULL,
    fecha_inicio_insertada DATE DEFAULT NULL,
    fecha_inicio_eliminada DATE DEFAULT NULL,
    fecha_fin_insertada DATE DEFAULT NULL,
    fecha_fin_eliminada DATE DEFAULT NULL,
    empresa_nit_insertado INT DEFAULT NULL,
    empresa_nit_eliminado INT DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EXPERIENCIA_LABORAL
DROP TRIGGER IF EXISTS experiencia_laboral_insert;

DELIMITER $$

CREATE TRIGGER experiencia_laboral_insert
AFTER INSERT ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion, id, egresado_cedula, conferencista_cedula,
        situacion_actual_insertada, sector_laboral_actual_insertado,
        cargo_insertado, fecha_inicio_insertada, fecha_fin_insertada,
        empresa_nit_insertado,
        usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.ID, NEW.EGRESADO_Cedula, NEW.CONFERENCISTA_Cedula,
        NEW.SituacionActual, NEW.SectorLaboralActual,
        NEW.Cargo, NEW.FechaInicio, NEW.FechaFin,
        NEW.EMPRESA_NIT,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EXPERIENCIA_LABORAL
DROP TRIGGER IF EXISTS experiencia_laboral_update;

DELIMITER $$

CREATE TRIGGER experiencia_laboral_update
AFTER UPDATE ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion, id, egresado_cedula, conferencista_cedula,
        situacion_actual_eliminada, situacion_actual_insertada,
        sector_laboral_actual_eliminado, sector_laboral_actual_insertado,
        cargo_eliminado, cargo_insertado,
        fecha_inicio_eliminada, fecha_inicio_insertada,
        fecha_fin_eliminada, fecha_fin_insertada,
        empresa_nit_eliminado, empresa_nit_insertado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.ID, NEW.EGRESADO_Cedula, NEW.CONFERENCISTA_Cedula,
        OLD.SituacionActual, NEW.SituacionActual,
        OLD.SectorLaboralActual, NEW.SectorLaboralActual,
        OLD.Cargo, NEW.Cargo,
        OLD.FechaInicio, NEW.FechaInicio,
        OLD.FechaFin, NEW.FechaFin,
        OLD.EMPRESA_NIT, NEW.EMPRESA_NIT,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EXPERIENCIA_LABORAL
DROP TRIGGER IF EXISTS experiencia_laboral_delete;

DELIMITER $$

CREATE TRIGGER experiencia_laboral_delete
AFTER DELETE ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion, id, egresado_cedula, conferencista_cedula,
        situacion_actual_eliminada, sector_laboral_actual_eliminado,
        cargo_eliminado, fecha_inicio_eliminada, fecha_fin_eliminada,
        empresa_nit_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.ID, OLD.EGRESADO_Cedula, OLD.CONFERENCISTA_Cedula,
        OLD.SituacionActual, OLD.SectorLaboralActual,
        OLD.Cargo, OLD.FechaInicio, OLD.FechaFin,
        OLD.EMPRESA_NIT,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para idioma
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_idioma;
CREATE TABLE Proyecto_BD.historial_idioma (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    id_idioma BIGINT,
    idioma_insertado VARCHAR(20) DEFAULT NULL,
    idioma_eliminado VARCHAR(20) DEFAULT NULL,
    nivel_insertado VARCHAR(3) DEFAULT NULL,
    nivel_eliminado VARCHAR(3) DEFAULT NULL,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en IDIOMA
DROP TRIGGER IF EXISTS idioma_insert;

DELIMITER $$

CREATE TRIGGER idioma_insert
AFTER INSERT ON Proyecto_BD.IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_idioma (
        fecha_cambio, accion, id_idioma, idioma_insertado, nivel_insertado, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.ID_Idioma, NEW.Idioma, NEW.Nivel, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en IDIOMA
DROP TRIGGER IF EXISTS idioma_update;

DELIMITER $$

CREATE TRIGGER idioma_update
AFTER UPDATE ON Proyecto_BD.IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_idioma (
        fecha_cambio, accion, id_idioma, idioma_eliminado, idioma_insertado,
        nivel_eliminado, nivel_insertado, usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.ID_Idioma, OLD.Idioma, NEW.Idioma,
        OLD.Nivel, NEW.Nivel, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en IDIOMA
DROP TRIGGER IF EXISTS idioma_delete;

DELIMITER $$

CREATE TRIGGER idioma_delete
AFTER DELETE ON Proyecto_BD.IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_idioma (
        fecha_cambio, accion, id_idioma, idioma_eliminado, nivel_eliminado, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.ID_Idioma, OLD.Idioma, OLD.Nivel, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para teléfono
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_telefono;
CREATE TABLE Proyecto_BD.historial_telefono (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula_egresado BIGINT,
    numero_telefono_insertado BIGINT,
    numero_telefono_eliminado BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en TELEFONO
DROP TRIGGER IF EXISTS telefono_insert;

DELIMITER $$

CREATE TRIGGER telefono_insert
AFTER INSERT ON Proyecto_BD.TELEFONO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_telefono (
        fecha_cambio, accion, cedula_egresado, numero_telefono_insertado, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.EGRESADO_Cedula, NEW.Numero, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en TELEFONO
DROP TRIGGER IF EXISTS telefono_update;

DELIMITER $$

CREATE TRIGGER telefono_update
AFTER UPDATE ON Proyecto_BD.TELEFONO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_telefono (
        fecha_cambio, accion, cedula_egresado, numero_telefono_eliminado, numero_telefono_insertado, usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.EGRESADO_Cedula, OLD.Numero, NEW.Numero, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en TELEFONO
DROP TRIGGER IF EXISTS telefono_delete;

DELIMITER $$

CREATE TRIGGER telefono_delete
AFTER DELETE ON Proyecto_BD.TELEFONO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_telefono (
        fecha_cambio, accion, cedula_egresado, numero_telefono_eliminado, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.EGRESADO_Cedula, OLD.Numero, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para formación académica
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_formacion_academica;
CREATE TABLE Proyecto_BD.historial_formacion_academica (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    acta_grado INT,
    cedula_egresado BIGINT,
    cedula_conferencista BIGINT,
    universidad_insertada VARCHAR(100),
    facultad_insertada VARCHAR(45),
    programa_insertado VARCHAR(45),
    nivel_academico_insertado VARCHAR(45),
    año_grado_insertado VARCHAR(45),
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en FORMACION_ACADEMICA
DROP TRIGGER IF EXISTS formacion_academica_insert;

DELIMITER $$

CREATE TRIGGER formacion_academica_insert
AFTER INSERT ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion, acta_grado, cedula_egresado, cedula_conferencista,
        universidad_insertada, facultad_insertada, programa_insertado,
        nivel_academico_insertado, año_grado_insertado, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.ActaGrado, NEW.EGRESADO_Cedula, NEW.CONFERENCISTA_Cedula,
        NEW.Universidad, NEW.Facultad, NEW.Programa,
        NEW.NivelAcademico, NEW.AñoGrado, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en FORMACION_ACADEMICA
DROP TRIGGER IF EXISTS formacion_academica_update;

DELIMITER $$

CREATE TRIGGER formacion_academica_update
AFTER UPDATE ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion, acta_grado, cedula_egresado, cedula_conferencista,
        universidad_insertada, universidad_eliminada,
        facultad_insertada, facultad_eliminada,
        programa_insertado, programa_eliminado,
        nivel_academico_insertado, nivel_academico_eliminado,
        año_grado_insertado, año_grado_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.ActaGrado, NEW.EGRESADO_Cedula, NEW.CONFERENCISTA_Cedula,
        NEW.Universidad, OLD.Universidad,
        NEW.Facultad, OLD.Facultad,
        NEW.Programa, OLD.Programa,
        NEW.NivelAcademico, OLD.NivelAcademico,
        NEW.AñoGrado, OLD.AñoGrado,
        USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en FORMACION_ACADEMICA
DROP TRIGGER IF EXISTS formacion_academica_delete;

DELIMITER $$

CREATE TRIGGER formacion_academica_delete
AFTER DELETE ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion, acta_grado, cedula_egresado, cedula_conferencista,
        universidad_eliminada, facultad_eliminada, programa_eliminado,
        nivel_academico_eliminado, año_grado_eliminado,
        usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.ActaGrado, OLD.EGRESADO_Cedula, OLD.CONFERENCISTA_Cedula,
        OLD.Universidad, OLD.Facultad, OLD.Programa,
        OLD.NivelAcademico, OLD.AñoGrado,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para diálogos de egresados
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_dialogos_egresados;
CREATE TABLE Proyecto_BD.historial_dialogos_egresados (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    evento_id INT,
    tematica_insertada VARCHAR(20),
    tematica_eliminada VARCHAR(20),
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS dialogos_egresados_insert;

DELIMITER $$

CREATE TRIGGER dialogos_egresados_insert
AFTER INSERT ON Proyecto_BD.DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_dialogos_egresados (
        fecha_cambio, accion, evento_id, tematica_insertada, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.EVENTO_ID, NEW.Tematica, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS dialogos_egresados_update;

DELIMITER $$

CREATE TRIGGER dialogos_egresados_update
AFTER UPDATE ON Proyecto_BD.DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_dialogos_egresados (
        fecha_cambio, accion, evento_id, tematica_insertada, tematica_eliminada, usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.EVENTO_ID, NEW.Tematica, OLD.Tematica, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS dialogos_egresados_delete;

DELIMITER $$

CREATE TRIGGER dialogos_egresados_delete
AFTER DELETE ON Proyecto_BD.DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_dialogos_egresados (
        fecha_cambio, accion, evento_id, tematica_eliminada, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.EVENTO_ID, OLD.Tematica, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para catedras
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_catedra;
CREATE TABLE Proyecto_BD.historial_catedra (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    evento_id INT,
    tematica_insertada VARCHAR(20),
    tematica_eliminada VARCHAR(20),
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en CATEDRA
DROP TRIGGER IF EXISTS catedra_insert;

DELIMITER $$

CREATE TRIGGER catedra_insert
AFTER INSERT ON Proyecto_BD.CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_catedra (
        fecha_cambio, accion, evento_id, tematica_insertada, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.EVENTO_ID, NEW.Tematica, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en CATEDRA
DROP TRIGGER IF EXISTS catedra_update;

DELIMITER $$

CREATE TRIGGER catedra_update
AFTER UPDATE ON Proyecto_BD.CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_catedra (
        fecha_cambio, accion, evento_id, tematica_insertada, tematica_eliminada, usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.EVENTO_ID, NEW.Tematica, OLD.Tematica, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en CATEDRA
DROP TRIGGER IF EXISTS catedra_delete;

DELIMITER $$

CREATE TRIGGER catedra_delete
AFTER DELETE ON Proyecto_BD.CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_catedra (
        fecha_cambio, accion, evento_id, tematica_eliminada, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.EVENTO_ID, OLD.Tematica, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para coordinadores
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_coordinador;
CREATE TABLE Proyecto_BD.historial_coordinador (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    cedula BIGINT,
    nombres_insertados VARCHAR(45),
    primer_apellido_insertado VARCHAR(20),
    segundo_apellido_insertado VARCHAR(20),
    correo_insertado VARCHAR(45),
    telefono_insertado BIGINT,
    sede_id_insertada INT,
    nombres_eliminados VARCHAR(45),
    primer_apellido_eliminado VARCHAR(20),
    segundo_apellido_eliminado VARCHAR(20),
    correo_eliminado VARCHAR(45),
    telefono_eliminado BIGINT,
    sede_id_eliminada INT,
    usuario VARCHAR(50) DEFAULT NULL 
);

-- Trigger para INSERT en COORDINADOR
DROP TRIGGER IF EXISTS coordinador_insert;

DELIMITER $$

CREATE TRIGGER coordinador_insert
AFTER INSERT ON Proyecto_BD.COORDINADOR
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_coordinador (
        fecha_cambio, accion, cedula, nombres_insertados, primer_apellido_insertado,
        segundo_apellido_insertado, correo_insertado, telefono_insertado, sede_id_insertada, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.Cedula, NEW.Nombres, NEW.PrimerApellido,
        NEW.SegundoApellido, NEW.Correo, NEW.Telefono, NEW.SEDE_idSEDE, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en COORDINADOR
DROP TRIGGER IF EXISTS coordinador_update;

DELIMITER $$

CREATE TRIGGER coordinador_update
AFTER UPDATE ON Proyecto_BD.COORDINADOR
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_coordinador (
        fecha_cambio, accion, cedula, nombres_insertados, primer_apellido_insertado,
        segundo_apellido_insertado, correo_insertado, telefono_insertado, sede_id_insertada,
        nombres_eliminados, primer_apellido_eliminado, segundo_apellido_eliminado,
        correo_eliminado, telefono_eliminado, sede_id_eliminada, usuario
    )
    VALUES (
        NOW(), 'UPDATE', NEW.Cedula, NEW.Nombres, NEW.PrimerApellido,
        NEW.SegundoApellido, NEW.Correo, NEW.Telefono, NEW.SEDE_idSEDE,
        OLD.Nombres, OLD.PrimerApellido, OLD.SegundoApellido,
        OLD.Correo, OLD.Telefono, OLD.SEDE_idSEDE, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en COORDINADOR
DROP TRIGGER IF EXISTS coordinador_delete;

DELIMITER $$

CREATE TRIGGER coordinador_delete
AFTER DELETE ON Proyecto_BD.COORDINADOR
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_coordinador (
        fecha_cambio, accion, cedula, nombres_eliminados, primer_apellido_eliminado,
        segundo_apellido_eliminado, correo_eliminado, telefono_eliminado, sede_id_eliminada, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.Cedula, OLD.Nombres, OLD.PrimerApellido,
        OLD.SegundoApellido, OLD.Correo, OLD.Telefono, OLD.SEDE_idSEDE, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresados que asisten a catedra
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado_asiste_catedra;
CREATE TABLE Proyecto_BD.historial_egresado_asiste_catedra (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    catedra_evento_id INT,
    egresado_cedula BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EGRESADO_ASISTE_CATEDRA
DROP TRIGGER IF EXISTS egresado_asiste_catedra_insert;

DELIMITER $$

CREATE TRIGGER egresado_asiste_catedra_insert
AFTER INSERT ON Proyecto_BD.EGRESADO_ASISTE_CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_asiste_catedra (
        fecha_cambio, accion, catedra_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.CATEDRA_EVENTO_ID, NEW.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO_ASISTE_CATEDRA
DROP TRIGGER IF EXISTS egresado_asiste_catedra_delete;

DELIMITER $$

CREATE TRIGGER egresado_asiste_catedra_delete
AFTER DELETE ON Proyecto_BD.EGRESADO_ASISTE_CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_asiste_catedra (
        fecha_cambio, accion, catedra_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.CATEDRA_EVENTO_ID, OLD.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresados que dictan cátedra
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado_dicta_catedra;
CREATE TABLE Proyecto_BD.historial_egresado_dicta_catedra (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    catedra_evento_id INT,
    egresado_cedula BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EGRESADO_DICTA_CATEDRA
DROP TRIGGER IF EXISTS egresado_dicta_catedra_insert;

DELIMITER $$

CREATE TRIGGER egresado_dicta_catedra_insert
AFTER INSERT ON Proyecto_BD.EGRESADO_DICTA_CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_dicta_catedra (
        fecha_cambio, accion, catedra_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.CATEDRA_EVENTO_ID, NEW.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO_DICTA_CATEDRA
DROP TRIGGER IF EXISTS egresado_dicta_catedra_delete;

DELIMITER $$

CREATE TRIGGER egresado_dicta_catedra_delete
AFTER DELETE ON Proyecto_BD.EGRESADO_DICTA_CATEDRA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_dicta_catedra (
        fecha_cambio, accion, catedra_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.CATEDRA_EVENTO_ID, OLD.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresados que asisten a diálogos
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado_asiste_dialogos_egresados;
CREATE TABLE Proyecto_BD.historial_egresado_asiste_dialogos_egresados (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    dialogos_egresados_evento_id INT,
    egresado_cedula BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EGRESADO_ASISTE_DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS egresado_asiste_dialogos_egresados_insert;

DELIMITER $$

CREATE TRIGGER egresado_asiste_dialogos_egresados_insert
AFTER INSERT ON Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_asiste_dialogos_egresados (
        fecha_cambio, accion, dialogos_egresados_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.DIALOGOS_EGRESADOS_EVENTO_ID, NEW.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO_ASISTE_DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS egresado_asiste_dialogos_egresados_delete;

DELIMITER $$

CREATE TRIGGER egresado_asiste_dialogos_egresados_delete
AFTER DELETE ON Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_asiste_dialogos_egresados (
        fecha_cambio, accion, dialogos_egresados_evento_id, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.DIALOGOS_EGRESADOS_EVENTO_ID, OLD.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresados que aplican a ofertas laborales
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado_aplica_oferta_laboral;
CREATE TABLE Proyecto_BD.historial_egresado_aplica_oferta_laboral (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    oferta_laboral_no_oferta INT,
    egresado_cedula BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en EGRESADO_APLICA_OFERTA_LABORAL
DROP TRIGGER IF EXISTS egresado_aplica_oferta_laboral_insert;

DELIMITER $$

CREATE TRIGGER egresado_aplica_oferta_laboral_insert
AFTER INSERT ON Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_aplica_oferta_laboral (
        fecha_cambio, accion, oferta_laboral_no_oferta, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.OFERTA_LABORAL_No_oferta, NEW.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO_APLICA_OFERTA_LABORAL
DROP TRIGGER IF EXISTS egresado_aplica_oferta_laboral_delete;

DELIMITER $$

CREATE TRIGGER egresado_aplica_oferta_laboral_delete
AFTER DELETE ON Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_aplica_oferta_laboral (
        fecha_cambio, accion, oferta_laboral_no_oferta, egresado_cedula, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.OFERTA_LABORAL_No_oferta, OLD.EGRESADO_Cedula, USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para egresados que hablan idiomas
-- -----------------------------------------------------

-- Creación de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado_habla_idioma;
CREATE TABLE Proyecto_BD.historial_egresado_habla_idioma (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    idioma_id_idioma BIGINT,
    egresado_cedula BIGINT,
    id_certificado INT,
    usuario VARCHAR(50) DEFAULT NULL  -- Campo para el usuario que hizo la modificación
);

-- Trigger para INSERT en EGRESADO_HABLA_IDIOMA
DROP TRIGGER IF EXISTS egresado_habla_idioma_insert;

DELIMITER $$

CREATE TRIGGER egresado_habla_idioma_insert
AFTER INSERT ON Proyecto_BD.EGRESADO_HABLA_IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_habla_idioma (
        fecha_cambio, accion, idioma_id_idioma, egresado_cedula, id_certificado, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.IDIOMA_ID_Idioma, NEW.EGRESADO_Cedula, NEW.ID_Certificado, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en EGRESADO_HABLA_IDIOMA
DROP TRIGGER IF EXISTS egresado_habla_idioma_delete;

DELIMITER $$

CREATE TRIGGER egresado_habla_idioma_delete
AFTER DELETE ON Proyecto_BD.EGRESADO_HABLA_IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_habla_idioma (
        fecha_cambio, accion, idioma_id_idioma, egresado_cedula, id_certificado, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.IDIOMA_ID_Idioma, OLD.EGRESADO_Cedula, OLD.ID_Certificado, USER()
    );
END $$

DELIMITER ;

-- Trigger para UPDATE en EGRESADO_HABLA_IDIOMA
DROP TRIGGER IF EXISTS egresado_habla_idioma_update;

DELIMITER $$

CREATE TRIGGER egresado_habla_idioma_update
AFTER UPDATE ON Proyecto_BD.EGRESADO_HABLA_IDIOMA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado_habla_idioma (
        fecha_cambio, accion, idioma_id_idioma_old, idioma_id_idioma_new,
        egresado_cedula_old, egresado_cedula_new,
        id_certificado_old, id_certificado_new,
        usuario
    )
    VALUES (
        NOW(), 'UPDATE', OLD.IDIOMA_ID_Idioma, NEW.IDIOMA_ID_Idioma,
        OLD.EGRESADO_Cedula, NEW.EGRESADO_Cedula,
        OLD.ID_Certificado, NEW.ID_Certificado,
        USER()
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para conferencista_dicta_dialogos_egresados
-- -----------------------------------------------------

-- Creación de la tabla historial_conferencista_dicta_dialogos_egresados
DROP TABLE IF EXISTS Proyecto_BD.historial_conferencista_dicta_dialogos_egresados;
CREATE TABLE Proyecto_BD.historial_conferencista_dicta_dialogos_egresados (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id_H INT PRIMARY KEY AUTO_INCREMENT,
    dialogos_egresados_evento_id INT,
    conferencista_cedula BIGINT,
    usuario VARCHAR(50) DEFAULT NULL  
);

-- Trigger para INSERT en CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS conferencista_dicta_dialogos_egresados_insert;

DELIMITER $$

CREATE TRIGGER conferencista_dicta_dialogos_egresados_insert
AFTER INSERT ON Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_conferencista_dicta_dialogos_egresados (
        fecha_cambio, accion, dialogos_egresados_evento_id, conferencista_cedula, usuario
    )
    VALUES (
        NOW(), 'INSERT', NEW.DIALOGOS_EGRESADOS_EVENTO_ID, NEW.CONFERENCISTA_Cedula, USER()
    );
END $$

DELIMITER ;

-- Trigger para DELETE en CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
DROP TRIGGER IF EXISTS conferencista_dicta_dialogos_egresados_delete;

DELIMITER $$

CREATE TRIGGER conferencista_dicta_dialogos_egresados_delete
AFTER DELETE ON Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_conferencista_dicta_dialogos_egresados (
        fecha_cambio, accion, dialogos_egresados_evento_id, conferencista_cedula, usuario
    )
    VALUES (
        NOW(), 'DELETE', OLD.DIALOGOS_EGRESADOS_EVENTO_ID, OLD.CONFERENCISTA_Cedula, USER()
    );
END $$

DELIMITER ;


