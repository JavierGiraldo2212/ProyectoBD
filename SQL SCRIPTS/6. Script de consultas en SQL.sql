-------------------------------------------------------------------------
	                        -- Consultas --
-------------------------------------------------------------------------
-- Cantidad de ofertas laborales agrupadas por el área de conocimiento --
SELECT Area, COUNT(*) AS Num_Ofertas
FROM Proyecto_BD.OFERTA_LABORAL
GROUP BY Area;
-- Facultades y su personal de apoyo asignado --
SELECT f.Nombre AS Facultad, pa.Nombres, pa.PrimerApellido, pa.SegundoApellido
FROM Proyecto_BD.FACULTAD f
JOIN Proyecto_BD.PERSONAL_APOYO pa ON f.PERSONAL_APOYO_Cedula = pa.Cedula;
-- Eventos realizados en cada sede -- 
SELECT s.Nombre AS Sede, e.Nombre AS Evento, e.Fecha
FROM Proyecto_BD.SEDE s
JOIN Proyecto_BD.EVENTOS e ON s.idSEDE = e.SEDE_idSEDE;
-- Cantidad de asistentes máxima esperada por tipo de evento en cada sede -- 
SELECT s.Nombre AS Sede, e.Nombre AS Evento, SUM(e.MAX_Asistentes) AS Total_Asistentes
FROM Proyecto_BD.SEDE s
JOIN Proyecto_BD.EVENTOS e ON s.idSEDE = e.SEDE_idSEDE
GROUP BY s.Nombre, e.Nombre;
-- Ofertas laborales con salarios superiores a 3 millones agrupadas por tipo de contrato --
SELECT TipoContrato, COUNT(*) AS Num_Ofertas
FROM Proyecto_BD.OFERTA_LABORAL
WHERE Salario > 3000000
GROUP BY TipoContrato;
-- Facultades con más de un personal de apoyo asignado -- 
SELECT f.Nombre AS Facultad, COUNT(pa.Cedula) AS Num_Personal
FROM Proyecto_BD.FACULTAD f
JOIN Proyecto_BD.PERSONAL_APOYO pa ON f.PERSONAL_APOYO_Cedula = pa.Cedula
GROUP BY f.Nombre
HAVING COUNT(pa.Cedula) > 1;
-- Torneos deportivos y los equipos participantes -- 
SELECT td.Tipo AS Torneo, e.Nombre AS Equipo
FROM Proyecto_BD.TORNEO_DEPORTIVO td
JOIN Proyecto_BD.EQUIPO e ON td.EVENTO_ID = e.TORNEO_DEPORTIVO_EVENTO_ID;
-- Cantidad de eventos realizados en cada sede durante el mes de abril de 2024 --
SELECT s.Nombre AS Sede, COUNT(e.ID) AS Num_Eventos
FROM Proyecto_BD.SEDE s
JOIN Proyecto_BD.EVENTOS e ON s.idSEDE = e.SEDE_idSEDE
WHERE e.Fecha BETWEEN '2024-04-01' AND '2024-04-30'
GROUP BY s.Nombre;
-- Eventos con su descripción y la cantidad de asistentes máxima esperada, ordenados por la sede --
SELECT s.Nombre AS Sede, e.Nombre AS Evento, e.Descripcion, e.MAX_Asistentes
FROM Proyecto_BD.SEDE s
JOIN Proyecto_BD.EVENTOS e ON s.idSEDE = e.SEDE_idSEDE
ORDER BY s.Nombre;
-- Ofertas laborales de las empresas con NIT específico --
SELECT ol.No_oferta, ol.Area, ol.Salario, ol.TipoContrato, e.Nombre AS Empresa
FROM Proyecto_BD.OFERTA_LABORAL ol
JOIN Proyecto_BD.EMPRESA e ON ol.EMPRESA_NIT = e.NIT
WHERE e.NIT IN (900100100, 900100101);
-- Promedio de salario de ofertas laborales por área de conocimiento --
SELECT Area, AVG(Salario) AS Promedio_Salario
FROM Proyecto_BD.OFERTA_LABORAL
GROUP BY Area;
-- Nombres de los egresados y la facultad a la que pertenecen --
SELECT e.Nombre, e.PrimerApellido, f.Nombre AS Facultad
FROM Proyecto_BD.EGRESADO e
JOIN Proyecto_BD.FACULTAD f ON e.FACULTAD_idFACULTAD = f.idFACULTAD;
-- Cantidad de equipos por torneo deportivo --
SELECT td.Tipo AS Torneo, COUNT(e.ID) AS Num_Equipos
FROM Proyecto_BD.TORNEO_DEPORTIVO td
JOIN Proyecto_BD.EQUIPO e ON td.EVENTO_ID = e.TORNEO_DEPORTIVO_EVENTO_ID
GROUP BY td.Tipo;
-- Ofertas laborales ordenadas por salario en orden descendente -- 
SELECT * FROM Proyecto_BD.OFERTA_LABORAL
ORDER BY Salario DESC;
-- Cantidad de torneos deportivos por tipo y género -- 
SELECT Tipo, Sexo, COUNT(*) AS Num_Torneos
FROM Proyecto_BD.TORNEO_DEPORTIVO
GROUP BY Tipo, Sexo;


