
-- -----------------------------------------------------
-- Schema Proyecto_BD
-- -----------------------------------------------------
DROP DATABASE IF EXISTS Proyecto_BD ;
CREATE DATABASE IF NOT EXISTS Proyecto_BD DEFAULT CHARACTER SET utf8 ;
USE Proyecto_BD ;

-- -----------------------------------------------------
-- Table Proyecto_BD.REPRESENTANTE_EMPRESA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.REPRESENTANTE_EMPRESA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.REPRESENTANTE_EMPRESA (
  Cedula INT NOT NULL COMMENT 'Llave primaria. Numero de Cedula del representante de la empresa ante la universidad',
  Nombres VARCHAR(20) NOT NULL COMMENT 'Nombres del representante',
  PrimerApellido VARCHAR(20) NOT NULL COMMENT 'Primer apellido del representante',
  SegundoApellido VARCHAR(20) NOT NULL COMMENT 'Segundo apellido del representante',
  Cargo VARCHAR(45) NOT NULL COMMENT 'Cargo que desempeña dentro de la empresa',
  Correo VARCHAR(45) NOT NULL COMMENT 'Correo electronico del representante',
  Telefono VARCHAR(15) NOT NULL COMMENT 'Telefono del representante',
  PRIMARY KEY (Cedula))
ENGINE = InnoDB;
INSERT INTO Proyecto_BD.REPRESENTANTE_EMPRESA (Cedula, Nombres, PrimerApellido, SegundoApellido, Cargo, Correo, Telefono) VALUES
(1001001001, 'Carlos', 'Rodríguez', 'Martínez', 'Gerente General', 'carlos.rodriguez@empresa.com', '3001002001'),
(1001001002, 'María', 'Gómez', 'Pérez', 'Directora de Recursos Humanos', 'maria.gomez@empresa.com', '3001002002'),
(1001001003, 'Juan', 'Fernández', 'López', 'Jefe de Ventas', 'juan.fernandez@empresa.com', '3001002003'),
(1001001004, 'Ana', 'Martín', 'García', 'Coordinadora de Proyectos', 'ana.martin@empresa.com', '3001002004'),
(1001001005, 'Luis', 'Sánchez', 'Díaz', 'Analista Financiero', 'luis.sanchez@empresa.com', '3001002005'),
(1001001006, 'Laura', 'Jiménez', 'Hernández', 'Gerente de Marketing', 'laura.jimenez@empresa.com', '3001002006'),
(1001001007, 'Pedro', 'Ruiz', 'Torres', 'Director de Operaciones', 'pedro.ruiz@empresa.com', '3001002007'),
(1001001008, 'Sofía', 'Ramírez', 'Flores', 'Consultora de Negocios', 'sofia.ramirez@empresa.com', '3001002008');
SELECT * FROM Proyecto_BD.REPRESENTANTE_EMPRESA;


-- -----------------------------------------------------
-- Table Proyecto_BD.EMPRESA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EMPRESA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EMPRESA (
  NIT INT NOT NULL COMMENT 'LLave primaria, es el identificador unico de cada empresa en Colombia',
  Nombre VARCHAR(20) NOT NULL COMMENT 'Nombre de la empresa',
  Descripcion VARCHAR(50) NOT NULL COMMENT 'Descripcion de las actividades de la empresa',
  Campo VARCHAR(20) NOT NULL COMMENT 'Campo en el que se desempeña la empresa',
  Telefono VARCHAR(15) NOT NULL COMMENT 'Telefono de contacto de la empresa',
  Direccion VARCHAR(45) NOT NULL COMMENT 'Direccion de la empresa',
  CorreoElectronico VARCHAR(50) NOT NULL COMMENT 'Correo electronico de la empresa',
  PaginaWeb VARCHAR(45) NOT NULL COMMENT 'Pagina web asociada a la empresa',
  REPRESENTANTE_EMPRESA_Cedula INT NOT NULL COMMENT 'Llave foranea que relaciona la empresa con el representante inscrito en la universidad',
  PRIMARY KEY (NIT),
  CONSTRAINT fk_EMPRESA_REPRESENTANTE_EMPRESA1
    FOREIGN KEY (REPRESENTANTE_EMPRESA_Cedula)
    REFERENCES Proyecto_BD.REPRESENTANTE_EMPRESA (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO Proyecto_BD.EMPRESA (NIT, Nombre, Descripcion, Campo, Telefono, Direccion, CorreoElectronico, PaginaWeb, REPRESENTANTE_EMPRESA_Cedula) VALUES
(900100100, 'IBM', 'Fabricación de productos electrónicos', 'Tecnología', '3101002001', 'Calle 123 #45-67', 'contacto@IBM.com', 'www.IBM.com', 1001001001),
(900100101, 'BanUnal', 'Servicios financieros y bancarios', 'Finanzas', '3101002002', 'Carrera 7 #89-10', 'info@BanUnal.com', 'www.BanUnal.com', 1001001002),
(900100102, 'Perez abogados', 'Consultoría y asesoría legal', 'Legal', '3101002003', 'Avenida 15 #23-45', 'legal@Perezabogados.com', 'www.Perezabogados.com', 1001001003),
(900100103, 'ingesoft ', 'Desarrollo de software a medida', 'Tecnología', '3101002004', 'Calle 45 #12-34', 'desarrollo@ingesoft.com', 'www.ingesoft.com', 1001001004),
(900100104, 'Agroriente', 'Comercio de productos agrícolas', 'Agricultura', '3101002005', 'Carrera 8 #56-78', 'ventas@Agroriente.com', 'www.Agroriente.com', 1001001005),
(900100105, 'publiUnal', 'Marketing digital y publicidad', 'Marketing', '3101002006', 'Avenida 9 #34-56', 'marketing@publiUnal.com', 'www.publiUnal.com', 1001001006),
(900100106, 'Aeroexpress', 'Logística y distribución', 'Logística', '3101002007', 'Calle 67 #89-12', 'logistica@Aeroexpress.com', 'www.Aeroexpress.com', 1001001007),
(900100107, 'CryptoInversiones', 'Consultoría de negocios', 'Consultoría', '3101002008', 'Carrera 10 #45-67', 'consultoria@CryptoInversiones.com', 'www.CryptoInversiones.com', 1001001008);
SELECT * FROM Proyecto_BD.EMPRESA;


-- -----------------------------------------------------
-- Table Proyecto_BD.OFERTA_LABORAL
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.OFERTA_LABORAL;

CREATE TABLE IF NOT EXISTS Proyecto_BD.OFERTA_LABORAL (
  No_oferta INT NOT NULL AUTO_INCREMENT  COMMENT 'Representa la llave primaria de la entidad Oferta_laboral. Artificial',
  EMPRESA_NIT INT NOT NULL COMMENT 'Representa la llave foranea que relaciona la empresa que ofrece la vacante con la oferta',
  Estado ENUM('En definicion', 'Convocatoria abierta', 'En seleccion', 'Finalizada', 'Cancelada') NOT NULL COMMENT 'Estado de la oferta',
  Salario INT NOT NULL COMMENT 'Valor en pesos del salario que tendría el egresado',
  ExpRequerida INT NOT NULL COMMENT 'Valor en meses o años del tiempo mínimo de experiencia requerida',
  Area VARCHAR(40) NOT NULL COMMENT 'Área de conocimientos a desempeñar',
  TipoContrato VARCHAR(40) NOT NULL COMMENT 'Tipo del contrato propuesto: Término indefinido, prestación de servicios...',
  FechaPublicacion DATE NOT NULL COMMENT 'Fecha de publicación de la oferta',
  PRIMARY KEY (No_oferta),
  CONSTRAINT fk_OFERTA_LABORAL_EMPRESA1
    FOREIGN KEY (EMPRESA_NIT)
    REFERENCES Proyecto_BD.EMPRESA (NIT)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.OFERTA_LABORAL (No_oferta, EMPRESA_NIT, Estado, Salario, ExpRequerida, Area, TipoContrato, FechaPublicacion) VALUES
(1, 900100100, 'Convocatoria abierta', 3000000, 4, 'Desarrollo de software', 'Término indefinido', '2024-05-23'),
(2, 900100101, 'Convocatoria abierta', 3500000, 6, 'Servicios financieros', 'Prestación de servicios', '2024-05-23'),
(3, 900100102, 'Convocatoria abierta', 2800000, 2, 'Consultoría legal', 'Término indefinido', '2024-05-23'),
(4, 900100103, 'Convocatoria abierta', 3200000, 8, 'Desarrollo de software', 'Término indefinido', '2024-05-23'),
(5, 900100104, 'Convocatoria abierta', 2500000, 4, 'Comercio agrícola', 'Término fijo', '2024-05-23'),
(6, 900100105, 'Convocatoria abierta', 4000000, 6, 'Marketing digital', 'Prestación de servicios', '2024-05-23'),
(7, 900100106, 'Convocatoria abierta', 3500000, 4, 'Logística', 'Término indefinido', '2024-05-23'),
(8, 900100107, 'Convocatoria abierta', 3000000, 8, 'Consultoría de negocios', 'Término indefinido', '2024-05-23');
SELECT * FROM Proyecto_BD.OFERTA_LABORAL;

-- -----------------------------------------------------
-- Table Proyecto_BD.SEDE
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.SEDE ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.SEDE (
  idSEDE INT NOT NULL AUTO_INCREMENT COMMENT 'Numero identificador unico para cada sede.',
  Nombre VARCHAR(45) NOT NULL COMMENT 'Nombre oficial o comercial de la sede.',
  CorreoAdministracion VARCHAR(45) NOT NULL COMMENT 'Correo electronico del administrador a cargo de la sede.',
  PBX INT NOT NULL COMMENT 'Numero telefonico principal o central de la sede.',
  EXT INT NOT NULL COMMENT 'Extension telefonica para comunicarse directamente con un departamento o individuo especifico en la sede.',
  PRIMARY KEY (idSEDE))
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.SEDE (Nombre, CorreoAdministracion, PBX, EXT)
VALUES 
('Universidad Nacional de Colombia - Bogotá', 'admin_bogota@unal.edu.co', 1234567890, 101),
('Universidad Nacional de Colombia - Medellín', 'admin_medellin@unal.edu.co', 1234567891, 102),
('Universidad Nacional de Colombia - Manizales', 'admin_manizales@unal.edu.co', 1234567892, 103),
('Universidad Nacional de Colombia - Palmira', 'admin_palmira@unal.edu.co', 1234567893, 104);
SELECT * FROM Proyecto_BD.SEDE;


-- -----------------------------------------------------
-- Table Proyecto_BD.PERSONAL_APOYO
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.PERSONAL_APOYO ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.PERSONAL_APOYO (
  Cedula BIGINT NOT NULL COMMENT 'Numero unico de identificación del personal asignado a la facultad.',
  Nombres VARCHAR(45) NOT NULL COMMENT 'Nombres del personal.',
  PrimerApellido VARCHAR(20) NOT NULL COMMENT 'Primer apellido del personal.',
  SegundoApellido VARCHAR(20) NULL COMMENT 'Segundo apellido del personal.',
  Correo VARCHAR(45) NOT NULL COMMENT 'Correo electronico para contactar al personal.',
  Telefono BIGINT NOT NULL COMMENT 'Numero telefonico para contactar al personal.',
  PRIMARY KEY (Cedula))
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.PERSONAL_APOYO (Cedula, Nombres, PrimerApellido, SegundoApellido, Correo, Telefono)
VALUES 
(1001002009, 'Johan', 'Ramos', 'Mosquera', 'johan.ramos@unal.edu.co', '3002003001'),
(1001002010, 'Brian', 'Pérez', 'Ortiz', 'brian.perez@unal.edu.co', '3002003002'),
(1001002011, 'Gustavo', 'Cortés', 'López', 'gustavo.cortes@unal.edu.co', '3002003003'),
(1001002012, 'John', 'Amaya', 'López', 'john.amaya@unal.edu.co', '3002003004'),
(1001002013, 'Lucho', 'Flores', 'Jiménez', 'lucho.flores@unal.edu.co', '3002003005'),
(1001002014, 'Ximena', 'Peña', 'Alvarado', 'ximena.peña@unal.edu.co', '3002003006'),
(1001002015, 'Eva', 'Ospina', 'Sánchez', 'eva.ospina@unal.edu.co', '3002003007'),
(1001002016, 'Sara', 'Sánchez', 'Flores', 'sara.samchez@unal.edu.co', '3002003008'),
(1001002017, 'Alejandra', 'Ramirez', 'Gonzales', 'alejandra.ramirez@unal.edu.co', '3002003009'),
(1001002018, 'Paul', 'Gonzales', 'Garzón', 'paul.gonzales@unal.edu.co', '3002003010');
SELECT * FROM Proyecto_BD.PERSONAL_APOYO;
-- -----------------------------------------------------
-- Table Proyecto_BD.FACULTAD
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.FACULTAD ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.FACULTAD (
  idFACULTAD INT NOT NULL COMMENT 'Numero identificador unico para cada facultad (Llave primaria).',
  SEDE_idSEDE INT NOT NULL COMMENT 'ID de la sede a la que esta asignada la facultad (Llave foranea).',
  Nombre VARCHAR(50) NOT NULL COMMENT 'Nombre de la facultad.',
  Oficina VARCHAR(45) NOT NULL COMMENT 'Ubicacion de la oficina de la facultad.',
  CorreoAdministracion VARCHAR(45) NOT NULL COMMENT 'Correo electronico de la administración de la facultad.',
  PBX INT NOT NULL COMMENT 'Numero telefonico principal o central de la facultad.',
  EXT INT NOT NULL COMMENT 'Extension telefonica para comunicarse directamente con un departamento o individuo especifico en la facultad.',
  PERSONAL_APOYO_Cedula BIGINT NOT NULL COMMENT 'Cedula del personal de apoyo asignado a la facultad (Llave foranea).',
  PRIMARY KEY (idFACULTAD),
  CONSTRAINT fk_FACULTAD_SEDE1
    FOREIGN KEY (SEDE_idSEDE)
    REFERENCES Proyecto_BD.SEDE (idSEDE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FACULTAD_PERSONAL_APOYO1
    FOREIGN KEY (PERSONAL_APOYO_Cedula)
    REFERENCES Proyecto_BD.PERSONAL_APOYO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.FACULTAD (idFACULTAD, SEDE_idSEDE, Nombre, Oficina, CorreoAdministracion, PBX, EXT, PERSONAL_APOYO_Cedula)
VALUES 
(001, 1, 'Facultad de Ingeniería', 'Edif.U - Of. 100', 'admin_facu.ing@unal.edu.co', '1234567', 201, 1001002009),
(002, 2, 'Facultad de Artes', 'Edif.U - Of. 101', 'admin_facu.art@unal.edu.co', '1234568', 202, 1001002010),
(003, 3, 'Facultad de Ciencias Humanas', 'Edif.U - Of. 102', 'admin_facu.cienciasH@unal.edu.co', '1234569', 203, 1001002011),
(004, 4, 'Facultad de Ciencias', 'Edif.U - Of. 103', 'admin_facu.ciencias@unal.edu.co', '1234510', 204, 1001002012),
(005, 1, 'Facultad de Ciencias Económicas', 'Edif.U - Of. 104', 'admin_facu.cienciasE@unal.edu.co', '1234511', 205, 1001002013),
(006, 2, 'Facultad de Medicina', 'Edif.U - Of. 105', 'admin_facu.med@unal.edu.co', '1234512', 206, 1001002014),
(007, 3, 'Facultad de Ciencias Agrarias', 'Edif.U - Of. 106', 'admin_facu.cienciasA@unal.edu.co', '1234513', 207, 1001002015),
(008, 4, 'Facultad de Odontología', 'Edif.U - Of. 107', 'admin_facu.odont@unal.edu.co', '1234514', 208, 1001002016),
(009, 1, 'Facultad de Medicina Veterinaria y de Zootecnia', 'Edif.U - Of. 108', 'admin_facu.medVZ@unal.edu.co', '1234515', 209, 1001002017),
(010, 2, 'Facultad de Derecho, Ciencias Políticas y Sociales', 'Edif.U - Of. 109', 'admin_facu.Derecho@unal.edu.co', '1234516', 210, 1001002018);
SELECT * FROM Proyecto_BD.FACULTAD;

-- -----------------------------------------------------
-- Table Proyecto_BD.EVENTOS
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EVENTOS ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EVENTOS (
  ID INT NOT NULL AUTO_INCREMENT  COMMENT 'Representa la llave primaria de la entidad EVENTOS de tipo numerico',

  SEDE_idSEDE INT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada evento con una unica sede',
  Nombre VARCHAR(40) NOT NULL COMMENT 'Nombre del evento ',
  Descripcion VARCHAR(100) NOT NULL COMMENT 'Breve descripcion del evento',
  Fecha DATE NOT NULL COMMENT 'Fecha en la que se realiza el evento',
  Hora TIME NOT NULL COMMENT 'Hora en la que se lleva a cabo el evento',
  Lugar_plataforma VARCHAR(45) NOT NULL COMMENT 'Lugar o plataforma en el que se realiza el evento',
  MAX_Asistentes VARCHAR(45) NULL COMMENT 'Numero de asistentes esperados al evento',
  PRIMARY KEY (ID),
  CONSTRAINT fk_PROYECTO_SEDE1
    FOREIGN KEY (SEDE_idSEDE)
    REFERENCES Proyecto_BD.SEDE (idSEDE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
ROW_FORMAT = DYNAMIC;
ALTER TABLE Proyecto_BD.EVENTOS AUTO_INCREMENT = 1000;

INSERT INTO Proyecto_BD.EVENTOS (SEDE_idSEDE, Nombre, Descripcion, Fecha, Hora, Lugar_plataforma, MAX_Asistentes)
VALUES 
(1, 'Catedra Egresados Bogotá', 'Catedra de egresados Bimestral', '2024-04-01', '10:00', 'Auditoria A', 60 ),
(1, 'Dialogos egresados Bogotá', 'Conferencia sobre campos en la industria', '2024-04-02', '08:00', 'Auditorio A', 45),
(1, 'Torneo Baloncesto', 'Torneo interfacultad de baloncesto', '2024-04-05', '09:00','Polideportivo', 100),
(2, 'Catedra Egresados Medellín', 'Catedra de egresados Bimestral', '2024-04-03', '09:30', 'Estadio', 50),
(2, 'Dialogos egresado Medellín', 'Conferencia sobre marco legal de comercio', '2024-04-01', '15:00', 'Biblioteca central', 45),
(2, 'Torneo Futbol 5', 'Torneo interfacultad de Futbol 5', '2024-04-05', '09:00','Cancha cubierta', 100),
(3, 'Catedra Egresados Manizales', 'Catedra de egresados Bimestral', '2024-04-02', '12:00', 'Sala de Conferencias A', 60),
(3, 'Dialogos egresado Manizales', 'Conferencia sobre marco legal de comercio', '2024-04-03', '19:00', 'Google Meet', 70),
(3, 'Voleibol', 'Torneo interfacultad de Voleibol', '2024-04-05', '09:00','Unidad deportiva', 100),
(4, 'Catedra Egresados Palmira', 'Catedra de egresados Bimestral', '2024-04-01', '17:00', 'Sala de conferencias', 75),
(4, 'Dialogos egresado Palmira', 'Conferencia sobre oportunidades de inversion', '2024-04-02', '09:00', 'Google Meet', 60),
(4, 'Voleibol', 'Torneo de Voleibol', '2024-04-05', '09:00','Estadio', 100);


-- En caso de querer poner mas datos continuar hacia abajo, ya que este orden se mantiene con los torneos y demas eventos

SELECT * FROM Proyecto_BD.EVENTOS;

-- -----------------------------------------------------
-- Table Proyecto_BD.TORNEO_DEPORTIVO
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.TORNEO_DEPORTIVO ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.TORNEO_DEPORTIVO (
  EVENTO_ID INT NOT NULL COMMENT 'Representa la llave primaria heredada de la entidad EVENTOS de tipo numerico',
  Tipo VARCHAR(15) NOT NULL COMMENT 'Tipo de torneo que se lleva a cabo',
  Duracion INT NOT NULL COMMENT 'Duracion del torneo en semanas',
  Sexo CHAR(3) BINARY NOT NULL COMMENT 'Se refiere a si es un torneo con equipos femeninos o masculinos',
  Premio VARCHAR(45) NULL COMMENT 'Premio del torneo',
  PRIMARY KEY (EVENTO_ID),
  CONSTRAINT fk_TORNEO_DEPORTIVO_PROYECTO
    FOREIGN KEY (EVENTO_ID)
    REFERENCES Proyecto_BD.EVENTOS (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
;

INSERT INTO Proyecto_BD.TORNEO_DEPORTIVO (EVENTO_ID , Tipo, Duracion, Sexo, Premio)
VALUES 
(1002, 'Baloncesto', 2, 'F', '$100.000'),
(1005, 'Futbol 5', 2, 'M', 'Implementos deportivos'),
(1008, 'Voleibol', 2, 'MyF', 'Implementos deportivos'),
(1011, 'Voleibol', 2, 'MyF', 'Implementos deportivos');
SELECT * FROM Proyecto_BD.TORNEO_DEPORTIVO;



-- -----------------------------------------------------
-- Table Proyecto_BD.EQUIPO
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EQUIPO ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EQUIPO (
  ID INT NOT NULL AUTO_INCREMENT COMMENT 'Representa la llave primaria de la entidad EQUIPOS de tipo numerico',
  TORNEO_DEPORTIVO_EVENTO_ID INT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada equipo con un unico torneo deportivo',
  Nombre VARCHAR(20) NOT NULL COMMENT 'Nombre del equipo',
  Clasificacion VARCHAR(20) NOT NULL COMMENT 'La clasificacion en la quedo el equipo en el torneo deportivo',
  PRIMARY KEY (ID),
  CONSTRAINT fk_EQUIPO_TORNEO_DEPORTIVO1
    FOREIGN KEY (TORNEO_DEPORTIVO_EVENTO_ID)
    REFERENCES Proyecto_BD.TORNEO_DEPORTIVO (EVENTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EQUIPO (ID , TORNEO_DEPORTIVO_EVENTO_ID, Nombre, Clasificacion)
VALUES 
(20001, 1002, 'Gladiadores', '1'),
(20002, 1002, 'Titanes', '2'),
(20003, 1002, 'Fénix', '3'),
(20004, 1002, 'Vikingos', '4'),

(20005, 1005, 'Dragones', '1'),
(20006, 1005, 'Halcones', '2'),
(20007, 1005, 'Leones', '3'),
(20008, 1005, 'Linces', '4'),

(20009, 1008, 'Tiburones', '1'),
(20010, 1008, 'Pumas', '2'),
(20011, 1008, 'Águilas', '3'),
(20012, 1008, 'Lanceros', '4'),

(20013, 1011, 'Cobras', '1'),
(20014, 1011, 'Panteras', '2'),
(20015, 1011, 'Jaguares', '3'),
(20016, 1011, 'Buhos', '4');

SELECT * FROM Proyecto_BD.EQUIPO;
-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO (
  Cedula BIGINT NOT NULL COMMENT 'Numero unico de identificación (Llave primaria).',
  FACULTAD_idFACULTAD INT NOT NULL COMMENT 'ID de la facultad a la que pertenece el egresado.',
  FechaNacimiento DATE NOT NULL COMMENT 'Fecha de nacimiento del egresado.',
  Nombre VARCHAR(45) NOT NULL COMMENT 'Nombres del egresado.',
  PrimerApellido VARCHAR(20) NOT NULL COMMENT 'Primer apellido del egresado.',
  SegundoApellido VARCHAR(20) NULL COMMENT 'Segundo apellido del egresado.',
  Direccion VARCHAR(45) NOT NULL COMMENT 'Direccion del egresado.',
  Ciudad VARCHAR(20) NOT NULL COMMENT 'Ciudad de residencia del egresado.',
  Pais VARCHAR(20) NOT NULL COMMENT 'Pais de residencia del egresado.',
  CorreoElectronico VARCHAR(50) NOT NULL COMMENT 'Correo electronico del egresado.',
  Contrasenia VARCHAR(45) NOT NULL COMMENT 'Contrasenia del egresado. (Debe almacenar la contrasenia cifrada)',
  Genero CHAR(1) NOT NULL COMMENT 'Genero del egresado (M/F).',
  GrupoEtnico VARCHAR(20) NOT NULL COMMENT 'Grupo etnico al que pertenece el egresado.',
  EQUIPO_ID INT NULL COMMENT 'ID del equipo al quepertenece el egresado (en caso de participar en los torneos deportivos)',
  PRIMARY KEY (Cedula),
  CONSTRAINT fk_EGRESADO_FACULTAD1
    FOREIGN KEY (FACULTAD_idFACULTAD)
    REFERENCES Proyecto_BD.FACULTAD (idFACULTAD)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EGRESADO_EQUIPO1
    FOREIGN KEY (EQUIPO_ID)
    REFERENCES Proyecto_BD.EQUIPO (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO (Cedula , FACULTAD_idFACULTAD, FechaNacimiento, Nombre, PrimerApellido, SegundoApellido, Direccion,
Ciudad, Pais, CorreoElectronico, Contrasenia, Genero, GrupoEtnico, EQUIPO_ID)
VALUES
(10000001, 001, '1990-01-01', 'Diana', 'Pérez', 'Gómez', 'Calle 123 # 26-78', 'Bogotá', 'Colombia', 'diana.perez001@unal.edu.co', 'pass123', 'F', 'Ninguno', 20001),
(10000002, 001, '1991-02-02', 'María', 'Rodríguez', 'López', 'Carrera 45 # 30-24', 'Bogotá', 'Colombia', 'maria.rodriguez001@unal.edu.co', 'pass123', 'F', 'Ninguno', 20001),
(10000003, 001, '1992-03-03', 'Fernanda', 'García', 'Martínez', 'Avenida 67 # 123a 86 sur', 'Bogotá', 'Colombia', 'fernanda.garcia001@unal.edu.co', 'pass123', 'F', 'Ninguno', 20002),
(10000013, 005, '1990-01-13', 'Luisa', 'García', 'Torres', 'Calle 176 # 13 - 98', 'Bogotá', 'Colombia', 'Luisa.garcia005@unal.edu.co', 'pass123', 'F', 'Ninguno', 20003),
(10000014, 005, '1991-02-14', 'Isabel', 'Mendoza', 'López', 'Carrera 98 # 12 - 08', 'Soacha', 'Colombia', 'isabel.mendoza005@unal.edu.co', 'pass123', 'F', 'Ninguno', 20004),
(10000015, 005, '1992-03-15', 'Andrea', 'González', 'Ruiz', 'Avenida 32 # 06 - 24', 'Bogotá', 'Colombia', 'andrea.gonzalez005@unal.edu.co', 'pass123', 'F', 'Ninguno', 20004),
(10000025, 009, '1990-01-25', 'Camila', 'Castro', 'López', 'Calle 40 # 07 - 12', 'Cota', 'Colombia', 'camila.castro009@unal.edu.co', 'pass123', 'F', 'Ninguno', 20003),
(10000026, 009, '1991-02-26', 'Lorena', 'Paredes', 'Gómez', 'Carrera 56 # 26 - 07', 'Soacha', 'Colombia', 'lorena.paredes@unal.edu.co', '123456','F', 'Ninguno', 20002),

('10000004', '002', '1990-04-04', 'Jose', 'Hernández', 'Torres', 'Calle 89 # 12 - 69', 'Medellín', 'Colombia', 'jose.hernandez002@unal.edu.co', 'pass123', 'M', 'Ninguno', 20005),
('10000005', '002', '1991-05-05', 'Luis', 'Ramírez', 'Cruz', 'Carrera 101 # 23 - 05', 'Medellín', 'Colombia', 'luis.ramirez002@unal.edu.co', 'pass123', 'M', 'Ninguno', 20006),
('10000006', '002', '1992-06-06', 'Lautaro', 'Sánchez', 'Gómez', 'Avenida 12 # 56 - 08', 'Medellín', 'Colombia', 'lautaro.sanchez002@unal.edu.co', 'pass123', 'M', 'Ninguno', 20007),
('10000016', '006', '1990-04-16', 'Martin', 'Soto', 'Díaz', 'Calle 34 # 82 - 36', 'Medellín', 'Colombia', 'martin.soto006@unal.edu.co', 'pass123', 'M', 'Ninguno', 20008),
('10000017', '006', '1991-05-17', 'Alberto', 'Moreno', 'Gómez', 'Carrera 64 # 17 - 89', 'Medellín', 'Colombia', 'alberto.moreno006@unal.edu.co', 'pass123', 'M', 'Ninguno', 20005),
('10000018', '006', '1992-06-18', 'Patricio', 'Ortiz', 'López', 'Avenida 38 # 05 - 94', 'Medellín', 'Colombia', 'patricio.ortiz006@unal.edu.co', 'pass123', 'M', 'Ninguno', 20006),

('10000007', '003', '1990-07-07', 'Miguel', 'López', 'Pérez', 'Calle 45 # 26 - 08', 'Manizales', 'Colombia', 'miguel.lopez003@unal.edu.co', 'pass123', 'M', 'Ninguno', 20009),
('10000008', '003', '1991-08-08', 'Lucía', 'Díaz', 'Ramírez', 'Carrera 16 # 12 - 36', 'Manizales', 'Colombia', 'lucia.diaz003@unal.edu.co', 'pass123', 'F', 'Ninguno', 20010),
('10000009', '003', '1992-09-09', 'Jorge', 'Martínez', 'Sánchez', 'Avenida 18 # 05 - 08', 'Manizales', 'Colombia', 'jorge.martinez003@unal.edu.co', 'pass123', 'M', 'Ninguno', 20011),
('10000019', '007', '1990-07-19', 'Fernando', 'Cruz', 'Pérez', 'Calle 08 # 45 - 06', 'Manizales', 'Colombia', 'fernando.cruz007@unal.edu.co', 'pass123', 'M', 'Ninguno', 20012),
('10000020', '007', '1991-08-20', 'Claudia', 'Peña', 'García', 'Carrera 30 # 16 - 08', 'Manizales', 'Colombia', 'claudia.pena007@unal.edu.co', 'pass123', 'F', 'Ninguno', 20009),
('10000021', '007', '1992-09-21', 'Ricardo', 'Vargas', 'Martínez', 'Avenida 2 # 25 - 98', 'Manizales', 'Colombia', 'ricardo.vargas007@unal.edu.co', 'pass123', 'M', 'Ninguno', 20010),

('10000010', '004', '1990-10-10', 'Sara', 'Gómez', 'López', 'Calle 21 # 35 - 93', 'Palmira', 'Colombia', 'sara.gomez004@unal.edu.co', 'pass123', 'F', 'Ninguno', 20013),
('10000011', '004', '1991-11-11', 'Pedro', 'Ruiz', 'Díaz', 'Carrera 32 # 07 - 24', 'Palmira', 'Colombia', 'pedro.ruiz004@unal.edu.co', 'pass123', 'M', 'Ninguno', 20014),
('10000012', '004', '1992-12-12', 'Elena', 'Hernández', 'Ramírez', 'Avenida 5 # 54 - 35', 'Palmira', 'Colombia', 'elena.hernandez004@unal.edu.co', 'pass123', 'F', 'Ninguno', 20015),
('10000022', '008', '1990-10-22', 'Beatriz', 'Fernández', 'Rodríguez', 'Calle 47 # 23 - 88', 'Cali', 'Colombia', 'beatriz.fernandez008@unal.edu.co', 'pass123', 'F', 'Ninguno', 20016),
('10000023', '008', '1991-11-23', 'Gustavo', 'Guerrero', 'Ramírez', 'Carrera 46 # 63 - 15', 'Cali', 'Colombia', 'gustavo.guerrero008@unal.edu.co', 'pass123', 'M', 'Ninguno', 20013),
('10000024', '008', '1992-12-24', 'Nathalia', 'Ruiz', 'Sánchez', 'Avenida 18 # 24 - 12', 'Cali', 'Colombia', 'nathalia.ruiz008@unal.edu.co', 'pass123', 'F', 'Ninguno', 20014);

INSERT INTO Proyecto_BD.EGRESADO (Cedula, FACULTAD_idFACULTAD, FechaNacimiento, Nombre, PrimerApellido, SegundoApellido, Direccion, Ciudad, Pais, CorreoElectronico, Contrasenia, Genero, GrupoEtnico, EQUIPO_ID)
VALUES 
(1001003011, 001, '1990-05-19', 'Raul', 'Perez', 'Barrera', 'CLL 39B N 21-35', 'Medellin', 'Colombia', 'raul.perez@unal.edu.co', 'raulperez1905..', 'M', 'Ninguno', NULL),
(1002003012, 002, '1988-11-23', 'Maria', 'Gomez', 'Lopez', 'CLL 50A N 10-25', 'Bogotá', 'Colombia', 'maria.gomez@unal.edu.co', 'mariagomez2311..', 'F', 'Ninguno', NULL),
(1003003013, 003, '1992-03-14', 'Carlos', 'Rodriguez', 'Martinez', 'CR 12 N 45-67', 'Cali', 'Colombia', 'carlos.rodriguez@unal.edu.co', 'carlosrodriguez1403..', 'M', 'Ninguno', NULL),
(1004003014, 004, '1995-07-07', 'Laura', 'Fernandez', 'Ruiz', 'CLL 70 N 30-50', 'Barranquilla', 'Colombia', 'laura.fernandez@unal.edu.co', 'laurafernandez0707..', 'F', 'Ninguno', NULL),
(1005003015, 005, '1989-09-28', 'Andres', 'Hernandez', 'Gomez', 'AV 68 N 22-33', 'Cartagena', 'Colombia', 'andres.hernandez@unal.edu.co', 'andreshernandez2809..', 'M', 'Ninguno', NULL),
(1006003016, 006, '1993-02-17', 'Paula', 'Diaz', 'Vargas', 'CLL 23 N 18-20', 'Bucaramanga', 'Colombia', 'paula.diaz@unal.edu.co', 'pauladiaz1702..', 'F', 'Ninguno', NULL),
(1007003017, 007, '1991-12-05', 'Santiago', 'Morales', 'Ramirez', 'CLL 88 N 12-10', 'Pereira', 'Colombia', 'santiago.morales@unal.edu.co', 'santiagomorales0512..', 'M', 'Ninguno', NULL),
(1008003018, 008, '1994-01-30', 'Angela', 'Torres', 'Mejia', 'CLL 45 N 15-25', 'Manizales', 'Colombia', 'angela.torres@unal.edu.co', 'angelatorres3001..', 'F', 'Ninguno', NULL),
(1009003019, 009, '1987-06-12', 'Javier', 'Vega', 'Ortiz', 'CLL 33 N 20-40', 'Cúcuta', 'Colombia', 'javier.vega@unal.edu.co', 'javiervega1206..', 'M', 'Ninguno', NULL),
(1010003020, 010, '1996-04-22', 'Isabel', 'Mendoza', 'Salazar', 'CLL 12 N 55-22', 'Neiva', 'Colombia', 'isabel.mendoza@unal.edu.co', 'isabelmendoza2204..', 'F', 'Ninguno', NULL);





SELECT * FROM Proyecto_BD.EGRESADO;

-- -----------------------------------------------------
-- Table Proyecto_BD.CONFERENCISTA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.CONFERENCISTA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.CONFERENCISTA (
  Cedula BIGINT NOT NULL COMMENT 'Cedula es el identificador unico para una persona en colombia',
  Nombres VARCHAR(45) NOT NULL COMMENT 'Nombres del conferencista',
  PrimerApellido VARCHAR(20) NOT NULL COMMENT 'Primer apellido del conferencista',
  SegundoApellido VARCHAR(20) NULL COMMENT 'Segundo Apellido del conferencista',
  Correo VARCHAR(45) NOT NULL COMMENT 'Correo electronico ',
  Telefono BIGINT NOT NULL COMMENT 'Telefono personal del conferencista',
  
  PRIMARY KEY (Cedula))
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.CONFERENCISTA (Cedula, Nombres, PrimerApellido, SegundoApellido, 
Correo, Telefono)
VALUES 
(970220000, 'Armando', 'Arias', 'Lopez', 'armando.arias@kmail.com',3100000123),
(970220001, 'Cecilia', 'Orosco', 'Perez', 'Cecilia.Orosco@kmail.com',3100000124),
(970220002, 'Ana', 'Obregon', 'Borbon', 'Ana.Obregon@kmail.com',3100000125);

SELECT * FROM Proyecto_BD.CONFERENCISTA;

-- -----------------------------------------------------
-- Table Proyecto_BD.EXPERIENCIA_LABORAL
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EXPERIENCIA_LABORAL ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EXPERIENCIA_LABORAL (
  
  ID INT NOT NULL AUTO_INCREMENT COMMENT 'Representa la llave primaria de la entidad EXPERIENCIA_LABOPRAL de tipo numerico',
  EGRESADO_Cedula BIGINT COMMENT 'Representa la llave foranea que relaciona egresado con su experiencia laboral, sirve de llave primaria',
  CONFERENCISTA_Cedula BIGINT COMMENT 'Representa la llave foranea que relaciona conferencista con su experiencia laboral, sirve de llave primaria',
  SituacionActual VARCHAR(20) NOT NULL COMMENT 'Estado en el que se encuentra, ya sea que actualemente se encuentre trabajando o ya se halla retirado de la empresa',
  SectorLaboralActual VARCHAR(45) NOT NULL COMMENT 'Area donde se desarrollo el trabajo: Ciencia de datos, medicina...',
  Cargo VARCHAR(40) NOT NULL COMMENT 'Cargo que se desempeno en la empresa',
  FechaInicio DATE NOT NULL COMMENT 'Fecha en la que inicio las labores en la empresa',
  FechaFin DATE COMMENT 'Fecha en la que finalizo labores, puede ser Null si se encuentra todavia laborando',
  EMPRESA_NIT INT NOT NULL COMMENT 'Representa la llave foranea que relaciona la Experiencia laboral con la empresa que la empresa donde se realizo',
  PRIMARY KEY (ID),
  CONSTRAINT fk_EXPERIENCIA_LABORAL_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EXPERIENCIA_LABORAL_EMPRESA1
    FOREIGN KEY (EMPRESA_NIT)
    REFERENCES Proyecto_BD.EMPRESA (NIT)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EXPERIENCIA_LABORAL_CONFERENCISTA1
    FOREIGN KEY (CONFERENCISTA_Cedula)
    REFERENCES Proyecto_BD.CONFERENCISTA (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EXPERIENCIA_LABORAL (ID, EGRESADO_Cedula, SituacionActual, SectorLaboralActual, Cargo, FechaInicio, FechaFin, EMPRESA_NIT)
VALUES 
(3000001,1001003011, 'Empleado', 'Fabricación de productos electrónicos', 'Gerente', '2018-05-12', NULL, 900100100),
(3000002,1001003011, 'ExEmpleado', 'Desarrollo de software a medida', 'Gerente', '2015-05-12', '2018-05-12', 900100103),
(3000003,1002003012, 'Empleado', 'Servicios financieros y bancarios', 'Analista Financiero', '2019-06-15', NULL, 900100101),
(3000004,1003003013, 'Empleado', 'Consultoría y asesoría legal', 'Abogado', '2018-09-01', NULL, 900100102),
(3000005,1004003014, 'Empleado', 'Desarrollo de software a medida', 'Desarrollador de Software', '2017-11-20', NULL, 900100103),
(3000006,1005003015, 'Empleado', 'Comercio de productos agrícolas', 'Gerente de Ventas', '2016-07-10', NULL, 900100104),
(3000007,1006003016, 'Empleado', 'Marketing digital y publicidad', 'Especialista en Marketing', '2020-01-05', NULL, 900100105),
(3000008,1007003017, 'Empleado', 'Logística y distribución', 'Coordinador de Logística', '2015-03-12', NULL, 900100106),
(3000009,1008003018, 'Empleado', 'Consultoría de negocios', 'Consultora de Negocios', '2021-09-18', NULL, 900100107),
(3000010,1009003019, 'Empleado', 'Fabricación de productos electrónicos', 'Jefe de Producción', '2018-05-25', NULL, 900100100),
(3000011,1010003020, 'Empleado', 'Servicios financieros y bancarios', 'Asesora Comercial', '2019-12-01', NULL, 900100101);

INSERT INTO Proyecto_BD.EXPERIENCIA_LABORAL (ID, CONFERENCISTA_Cedula, SituacionActual, SectorLaboralActual, Cargo, FechaInicio, FechaFin, EMPRESA_NIT)
VALUES 

(3000012,970220000, 'ExEmpleado', 'Desarrollo de software a medida', 'Investigador', '2005-05-12', '2018-05-12', 900100103),
(3000013,970220001, 'ExEmpleado', 'Consultoría y asesoría legal', 'Abogado', '1997-05-12', '2017-05-12', 900100102),
(3000014,970220002, 'ExEmpleado', 'Servicios financieros y bancarios', 'Inversionista', '2000-05-12', '2018-12-12', 900100107);

SELECT * FROM Proyecto_BD.EXPERIENCIA_LABORAL;


-- INSERT INTO Proyecto_BD.EXPERIENCIA_LABORAL (ID , EGRESADO_Cedula, CONFERENCISTA_Cedula, SituacionActual, SectorLaboralActual, SegundoApellido, Direccion,
-- Ciudad, Pais, CorreoElectronico, Contrasenia, Genero, GrupoEtnico, EQUIPO_ID)
-- VALUES

-- -----------------------------------------------------
-- Table Proyecto_BD.IDIOMA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.IDIOMA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.IDIOMA (
  ID_Idioma BIGINT NOT NULL COMMENT 'Identificador unico del idioma (ID)',
  Idioma VARCHAR(20) NOT NULL COMMENT 'Nombre del idioma',
  Nivel VARCHAR(3) NOT NULL COMMENT 'Nivel de competencia en eI idioma.',
  PRIMARY KEY (ID_Idioma))
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.IDIOMA (ID_Idioma, Idioma, Nivel)
VALUES 
(0001, 'Inglés', 'A1'),
(0002, 'Inglés', 'A2'),
(0003, 'Inglés', 'B1'),
(0004, 'Inglés', 'B2'),
(0005, 'Inglés', 'C1'),
(0006, 'Inglés', 'C2');
SELECT * FROM Proyecto_BD.IDIOMA;


-- -----------------------------------------------------
-- Table Proyecto_BD.TELEFONO
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.TELEFONO ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.TELEFONO (
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada telefono con el egresado correspondiente.',
  Numero BIGINT NOT NULL COMMENT 'Numero de telefono',
  PRIMARY KEY (EGRESADO_Cedula),
  CONSTRAINT fk_TELEFONO_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.TELEFONO (EGRESADO_Cedula,  Numero)
VALUES 
(1001003011, '3003004001'),
(1002003012, '3003004002'),
(1003003013, '3003004003'),
(1004003014, '3003004004'),
(1005003015, '3003004005'),
(1006003016, '3003004006'),
(1007003017, '3003004007'),
(1008003018, '3003004008'),
(1009003019, '3003004009'),
(1010003020, '3003004010'),

(10000001,	3003004009),
(10000002,	3003004010),
(10000003,	3003004011),
(10000004,	3003004012),
(10000005,	3003004013),
(10000006,	3003004014),
(10000007,	3003004015),
(10000008,	3003004016),
(10000009,	3003004017 ),
(10000010,	3003004018),
(10000011,	3003004019),
(10000012,	3003004020),
(10000013,	3003004021),
(10000014,	3003004022) ,
(10000015,	3003004023),
(10000016,	3003004024),
(10000017,	3003004025) ,
(10000018,	3003004026 ),
(10000019,	3003004027),
(10000020,	3003004028 ),
(10000021,	3003004029),
(10000022,	3003004030),
(10000023,	3003004031),
(10000024,	3003004032),
(10000025,	3003004033),
(10000026,	3003004034);

SELECT * FROM Proyecto_BD.TELEFONO;




-- -----------------------------------------------------
-- Table Proyecto_BD.FORMACION_ACADEMICA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.FORMACION_ACADEMICA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.FORMACION_ACADEMICA (
  ActaGrado INT NOT NULL COMMENT 'Numero del acta de grado asociado a la informacion academica, llave primaria',
  EGRESADO_Cedula BIGINT NULL COMMENT 'Llave foranea que representa la relación entre el egresado y su formacion academica',
  CONFERENCISTA_Cedula BIGINT NULL COMMENT 'Llave foranea que representa la relación entre el conferencista  y su formacion academica',
  Universidad VARCHAR(100) NOT NULL COMMENT 'Universidad donde se realizo la formacion',
  Facultad VARCHAR(45) NOT NULL COMMENT 'Facultad a la que pertenece el programa',
  Programa VARCHAR(45) NOT NULL COMMENT 'Nombre del programa del que se graduo',
  NivelAcademico VARCHAR(45) NOT NULL COMMENT 'Nivel academico del programa: Pregrado, especializacion, maestria...',
  AñoGrado VARCHAR(45) NOT NULL COMMENT 'Ano en el que se graduo',
  PRIMARY KEY (ActaGrado),
  CONSTRAINT fk_FORMACION_ACADEMICA_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FORMACION_ACADEMICA_CONFERENCISTA1
    FOREIGN KEY (CONFERENCISTA_Cedula)
    REFERENCES Proyecto_BD.CONFERENCISTA (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.FORMACION_ACADEMICA (ActaGrado, EGRESADO_Cedula, CONFERENCISTA_Cedula, Universidad, Facultad, Programa, NivelAcademico, AñoGrado)
VALUES 
(112233, 1001003011, NULL, 'Universidad Nacional de Colombia', 'Ingenieria', 'Ingerniería química', 'Pregrado', 2014),
(112234, 1002003012, NULL, 'Universidad Nacional de Colombia', 'Ciencias Sociales', 'Psicología', 'Pregrado', 2011),
(112235, 1003003013, NULL, 'Universidad Nacional de Colombia', 'Ciencias Económicas', 'Economía', 'Pregrado', 2016),
(112236, 1004003014, NULL, 'Universidad Nacional de Colombia', 'Ciencias Exactas y Naturales', 'Biología', 'Pregrado', 2017),
(112237, 1005003015, NULL, 'Universidad Nacional de Colombia', 'Ingeniería', 'Ingeniería Civil', 'Pregrado', 2013),
(112238, 1006003016, NULL, 'Universidad Nacional de Colombia', 'Ciencias', 'Física', 'Pregrado', 2015),
(112239, 1007003017, NULL, 'Universidad Nacional de Colombia', 'Ingeniería', 'Ingeniería de Sistemas', 'Pregrado', 2012),
(112240, 1008003018, NULL, 'Universidad Nacional de Colombia', 'Ciencias de la Salud', 'Medicina', 'Pregrado', 2018),
(112241, 1009003019, NULL, 'Universidad Nacional de Colombia', 'Ciencias Agrarias', 'Agronomía', 'Pregrado', 2010),
(112242, 1010003020, NULL, 'Universidad Nacional de Colombia', 'Ciencias de la Comunicación', 'Comunicación Social', 'Pregrado', 2019);
SELECT * FROM Proyecto_BD.FORMACION_ACADEMICA;


-- -----------------------------------------------------
-- Table Proyecto_BD.DIALOGOS_EGRESADOS
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.DIALOGOS_EGRESADOS ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.DIALOGOS_EGRESADOS (
  EVENTO_ID INT NOT NULL COMMENT 'Representa la llave primaria heredada de la entidad EVENTOS de tipo numerico',
  Tematica VARCHAR(20) NOT NULL COMMENT 'Representa la tematica de los dialogos con los egresados',
  PRIMARY KEY (EVENTO_ID),
  CONSTRAINT fk_DIALOGOS_EGRESADOS_PROYECTO1
    FOREIGN KEY (EVENTO_ID)
    REFERENCES Proyecto_BD.EVENTOS (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.DIALOGOS_EGRESADOS (EVENTO_ID , Tematica)
VALUES 
(1001, 'Campo Laboral'),
(1004, 'Legislación'),
(1007, 'Legislación'),
(1010, 'Inversiones');

SELECT * FROM Proyecto_BD.DIALOGOS_EGRESADOS;

-- -----------------------------------------------------
-- Table Proyecto_BD.CATEDRA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.CATEDRA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.CATEDRA (
  EVENTO_ID INT NOT NULL COMMENT 'Representa la llave primaria heredada de la entidad EVENTOS de tipo numerico',
  Tematica VARCHAR(20) NOT NULL COMMENT 'Representa la tematica de la catedra',
  PRIMARY KEY (EVENTO_ID),
  CONSTRAINT fk_CATEDRA_PROYECTO1
    FOREIGN KEY (EVENTO_ID)
    REFERENCES Proyecto_BD.EVENTOS (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.CATEDRA (EVENTO_ID , Tematica)
VALUES 
(1000, 'Campo Laboral' ),
(1003, 'Proyecto de vida'),
(1006, 'Campo Laboral' ),
(1009, 'Campo Laboral' );

SELECT * FROM Proyecto_BD.CATEDRA;

-- -----------------------------------------------------
-- Table Proyecto_BD.COORDINADOR
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.COORDINADOR ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.COORDINADOR (
  Cedula BIGINT NOT NULL COMMENT 'Numero de identificacion unico para cada coordinador (Llave primaria).',
  Nombres VARCHAR(45) NOT NULL COMMENT 'Nombres del coordinador.',
  PrimerApellido VARCHAR(20) NOT NULL COMMENT 'Primer apellido del coordinador.',
  SegundoApellido VARCHAR(20) NULL COMMENT 'Segundo apellido del coordinador.',
  Correo VARCHAR(45) NOT NULL COMMENT 'Correo electronico del coordinador.',
  Telefono BIGINT NOT NULL COMMENT 'Numero de telefono del coordinador.',
  SEDE_idSEDE INT NOT NULL COMMENT 'ID de la sede a la que esta asignado el coordinador (clave foranea).',
  PRIMARY KEY (Cedula, SEDE_idSEDE),
  CONSTRAINT fk_COORDINADOR_SEDE1
    FOREIGN KEY (SEDE_idSEDE)
    REFERENCES Proyecto_BD.SEDE (idSEDE)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.COORDINADOR (Cedula, Nombres, PrimerApellido, SegundoApellido, Correo, Telefono, SEDE_idSEDE)
VALUES 
(1001004001, 'Alexander', 'Contreras', 'Castro', 'alexander.contreras@unal.edu.co', '3004005001', 1),
(1002004002, 'Diego', 'Amaya', 'Bolaños', 'diego.amaya@unal.edu.co', '3004005002', 2),
(1003004003, 'Laura', 'Gonzalez', 'Rodriguez', 'laura.gonzalez@unal.edu.co', 3004005003, 3),
(1004004004, 'Carlos', 'Ramirez', 'Lopez', 'carlos.ramirez@unal.edu.co', 3004005004, 4);
SELECT * FROM Proyecto_BD.COORDINADOR;
-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO_ASISTE_CATEDRA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO_ASISTE_CATEDRA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO_ASISTE_CATEDRA (
  CATEDRA_EVENTO_ID INT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que asiste a la catedra con esta misma.',
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que asiste a la catedra con la cedula del mismo.',
  PRIMARY KEY (EGRESADO_Cedula, CATEDRA_EVENTO_ID),
  CONSTRAINT fk_CATEDRA_has_EGRESADO_CATEDRA1
    FOREIGN KEY (CATEDRA_EVENTO_ID)
    REFERENCES Proyecto_BD.CATEDRA (EVENTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CATEDRA_has_EGRESADO_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO_ASISTE_CATEDRA (EGRESADO_Cedula , CATEDRA_EVENTO_ID)
VALUES 
(10000002, 1000),
(10000003, 1000),
(10000013, 1000),
(10000014, 1000),
(10000015, 1000),
(10000025, 1000),
(10000026, 1000),

(10000016, 1003),
(10000005, 1003),
(10000006, 1003),
(10000017, 1003),
(10000018, 1003),

(10000008, 1006),
(10000009, 1006),
(10000019, 1006),
(10000020, 1006),
(10000021, 1006),

(10000011, 1009),
(10000012, 1009),
(10000022, 1009),
(10000023, 1009),
(10000024, 1009);






-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO_DICTA_CATEDRA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO_DICTA_CATEDRA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO_DICTA_CATEDRA (
  CATEDRA_EVENTO_ID INT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que dicta la catedra con esta misma.',
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que dicta la catedra con la cedula del mismo.',
  PRIMARY KEY (EGRESADO_Cedula, CATEDRA_EVENTO_ID),
  CONSTRAINT fk_CATEDRA_has_EGRESADO1_CATEDRA1
    FOREIGN KEY (CATEDRA_EVENTO_ID)
    REFERENCES Proyecto_BD.CATEDRA (EVENTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CATEDRA_has_EGRESADO1_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO_DICTA_CATEDRA (EGRESADO_Cedula , CATEDRA_EVENTO_ID)
VALUES 
(10000001, 1000),
(10000004, 1003),
(10000007, 1006),
(10000010, 1009);

SELECT * FROM Proyecto_BD.EGRESADO_DICTA_CATEDRA;
-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS (
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que asiste a los diaologos con los egresados con la cedula de los mismos.',
  DIALOGOS_EGRESADOS_EVENTO_ID INT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado que asiste a los dialogos con los egresados con estos ultimos.',
  PRIMARY KEY (EGRESADO_Cedula, DIALOGOS_EGRESADOS_EVENTO_ID),
  CONSTRAINT fk_EGRESADO_has_DIALOGOS_EGRESADOS_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EGRESADO_has_DIALOGOS_EGRESADOS_DIALOGOS_EGRESADOS1
    FOREIGN KEY (DIALOGOS_EGRESADOS_EVENTO_ID)
    REFERENCES Proyecto_BD.DIALOGOS_EGRESADOS (EVENTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS (EGRESADO_Cedula , DIALOGOS_EGRESADOS_EVENTO_ID)
VALUES 

(10000001, 1001),
(10000002, 1001),
(10000003, 1001),
(10000013, 1001),
(10000014, 1001),
(10000015, 1001),
(10000025, 1001),
(10000026, 1001),

(10000004, 1004),
(10000016, 1004),
(10000005, 1004),
(10000006, 1004),
(10000017, 1004),
(10000018, 1004),

(10000007, 1007),
(10000008, 1007),
(10000009, 1007),
(10000019, 1007),
(10000020, 1007),
(10000021, 1007),

(10000010, 1010),
(10000011, 1010),
(10000012, 1010),
(10000022, 1010),
(10000023, 1010),
(10000024, 1010);

SELECT * FROM EGRESADO_ASISTE_DIALOGOS_EGRESADOS;

-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL (
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Llave foranea que representa la relacion de un egresado con una oferta laboral',
  OFERTA_LABORAL_No_oferta INT NOT NULL COMMENT 'Llave foranea que representa la relacion de una oferta laboral con un egresado',
  PRIMARY KEY (EGRESADO_Cedula, OFERTA_LABORAL_No_oferta),
  CONSTRAINT fk_EGRESADO_has_OFERTA_LABORAL_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EGRESADO_has_OFERTA_LABORAL_OFERTA_LABORAL1
    FOREIGN KEY (OFERTA_LABORAL_No_oferta)
    REFERENCES Proyecto_BD.OFERTA_LABORAL (No_oferta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL (EGRESADO_Cedula , OFERTA_LABORAL_No_oferta)
VALUES 
(1002003012, 1),
(1004003014, 4),
(1010003020, 5),
(10000008, 8),
(10000020, 2);

SELECT * FROM Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL;
-- -----------------------------------------------------
-- Table Proyecto_BD.EGRESADO_HABLA_IDIOMA
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.EGRESADO_HABLA_IDIOMA ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.EGRESADO_HABLA_IDIOMA (
  EGRESADO_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada egresado con el idioma correspondiente.',
  IDIOMA_ID_Idioma BIGINT NOT NULL COMMENT 'Representa la llave foranea que relaciona cada idioma el cegresado correspondiente.',
  ID_Certificado INT NOT NULL COMMENT 'Identificador del certificado asociado.',
  PRIMARY KEY (EGRESADO_Cedula, IDIOMA_ID_Idioma),
  CONSTRAINT fk_EGRESADO_has_IDIOMA_EGRESADO1
    FOREIGN KEY (EGRESADO_Cedula)
    REFERENCES Proyecto_BD.EGRESADO (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EGRESADO_has_IDIOMA_IDIOMA1
    FOREIGN KEY (IDIOMA_ID_Idioma)
    REFERENCES Proyecto_BD.IDIOMA (ID_Idioma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Proyecto_BD.EGRESADO_HABLA_IDIOMA (EGRESADO_Cedula, IDIOMA_ID_Idioma, ID_Certificado)
VALUES 
(1001003011, 4, 2020),
(1002003012, 5, 2030),
(1003003013, 2, 2010),
(1004003014, 6, 2040),
(1005003015, 3, 2051),
(1006003016, 2, 2011),
(1007003017, 1, 2000),
(1008003018, 5, 2031),
(1009003019, 4, 2021),
(1010003020, 6, 2041);
SELECT * FROM Proyecto_BD.EGRESADO_HABLA_IDIOMA;


-- -----------------------------------------------------
-- Table Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS
-- -----------------------------------------------------
DROP TABLE IF EXISTS Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS ;

CREATE TABLE IF NOT EXISTS Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS (
  CONFERENCISTA_Cedula BIGINT NOT NULL COMMENT 'Representa la llave foránea que relaciona cada conferencista que dicta los dialogos con egresados con la cedula de los mismos.',
  DIALOGOS_EGRESADOS_EVENTO_ID INT NOT NULL COMMENT 'Representa la llave foranea que relaciona los conferencistas con los dialogos con egresados que dictan',
  PRIMARY KEY (CONFERENCISTA_Cedula, DIALOGOS_EGRESADOS_EVENTO_ID),
  CONSTRAINT fk_CONFERENCISTA_has_DIALOGOS_EGRESADOS_CONFERENCISTA1
    FOREIGN KEY (CONFERENCISTA_Cedula)
    REFERENCES Proyecto_BD.CONFERENCISTA (Cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CONFERENCISTA_has_DIALOGOS_EGRESADOS_DIALOGOS_EGRESADOS1
    FOREIGN KEY (DIALOGOS_EGRESADOS_EVENTO_ID)
    REFERENCES Proyecto_BD.DIALOGOS_EGRESADOS (EVENTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO Proyecto_BD.CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS (CONFERENCISTA_Cedula, DIALOGOS_EGRESADOS_EVENTO_ID)
VALUES 
(970220000, 1001),
(970220001, 1004),
(970220001, 1007),
(970220002, 1010);

SELECT * FROM CONFERENCISTA_DICTA_DIALOGOS_EGRESADOS;