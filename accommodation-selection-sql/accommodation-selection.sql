
-- ------------------------------------------------------------------------
--          ACCOMMODATION SELECTION WITH SQL - Bruno García López 
-- ------------------------------------------------------------------------


-- Create a database for the project and select it for use
CREATE DATABASE ProyectoFinal_SQL;
USE ProyectoFinal_SQL;

-- Create the ALOJAMIENTO, PRECIO, PUNTUACION, and UBICACION tables

CREATE TABLE ALOJAMIENTO(
CODIGO_ALOJAMIENTO VARCHAR(10) PRIMARY KEY,
NOMBRE VARCHAR(50),
CANT_BANYOS INT,
CANT_HAB INT,
SALON ENUM('SI', 'NO') DEFAULT 'NO',
TERRAZA ENUM('SI', 'NO') DEFAULT 'NO',
AIREC_ACOND ENUM('SI', 'NO') DEFAULT 'NO',
PISCINA ENUM('SI', 'NO') DEFAULT 'NO',
SUPERFICIE DECIMAL(10,2)
);

CREATE TABLE UBICACION (
CODIGO_ALOJAMIENTO VARCHAR(10) PRIMARY KEY,
PAIS VARCHAR(50),
CIUDAD VARCHAR(50),
DIST_METRO DECIMAL (10,2),
DIST_CENTRO DECIMAL (10,2),
CONSTRAINT fk_ubicacion_alojamiento 
        FOREIGN KEY (CODIGO_ALOJAMIENTO) 
        REFERENCES ALOJAMIENTO(CODIGO_ALOJAMIENTO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PRECIO (
CODIGO_ALOJAMIENTO VARCHAR(10) PRIMARY KEY,
PRECIO_ALQUILER DECIMAL (10,2),
RESERVA ENUM('SI', 'NO') DEFAULT 'NO',
`%_RESERVA` DECIMAL (10,2),
CONSTRAINT fk_precio_alojamiento 
        FOREIGN KEY (CODIGO_ALOJAMIENTO) 
        REFERENCES ALOJAMIENTO(CODIGO_ALOJAMIENTO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PUNTUACION (
CODIGO_ALOJAMIENTO VARCHAR(10) PRIMARY KEY,
PUNTOS DECIMAL(3,2),
AGENCIA VARCHAR (30),
PUNTOS_AGENCIA DECIMAL(3,2),
CONSTRAINT chk_puntuacion_max CHECK (PUNTOS >= 0 AND PUNTOS <= 5),
CONSTRAINT chk_puntosagencia_max CHECK (PUNTOS_AGENCIA >= 0 AND PUNTOS_AGENCIA <= 5),
CONSTRAINT fk_puntuacion_alojamiento 
        FOREIGN KEY (CODIGO_ALOJAMIENTO) 
        REFERENCES ALOJAMIENTO(CODIGO_ALOJAMIENTO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insert the data into the tables using INSERT (The Table Data Import Wizard returned an error on macOS)

INSERT INTO ALOJAMIENTO (CODIGO_ALOJAMIENTO, NOMBRE, CANT_BANYOS, CANT_HAB, SALON, TERRAZA, AIREC_ACOND, PISCINA, SUPERFICIE) VALUES
('ALOJ001', 'Villa Sol del Mar', 2, 3, 'SI', 'SI', 'SI', 'SI', 120),
('ALOJ002', 'Apartamento Las Palmeras', 1, 2, 'SI', 'NO', 'SI', 'NO', 75),
('ALOJ003', 'Cabaña El Refugio', 1, 1, 'NO', 'SI', 'NO', 'NO', 45),
('ALOJ004', 'Piso Centro Histórico', 2, 3, 'SI', 'SI', 'SI', 'NO', 90),
('ALOJ005', 'Estudio Playa Blanca', 1, 1, 'NO', 'NO', 'SI', 'NO', 40),
('ALOJ006', 'Chalet Vista al Lago', 3, 4, 'SI', 'SI', 'SI', 'SI', 150),
('ALOJ007', 'Dúplex Jardines del Sur', 2, 3, 'SI', 'SI', 'SI', 'SI', 130),
('ALOJ008', 'Loft Urbano', 1, 1, 'SI', 'NO', 'SI', 'NO', 60),
('ALOJ009', 'Casa Rústica Montaña', 2, 2, 'SI', 'SI', 'NO', 'NO', 85),
('ALOJ010', 'Ático del Sol', 3, 3, 'SI', 'SI', 'SI', 'NO', 88),
('ALOJ011', 'Cabaña Bosque Encantado', 1, 2, 'NO', 'SI', 'NO', 'NO', 65),
('ALOJ012', 'Villa Palmeras', 2, 3, 'SI', 'SI', 'SI', 'SI', 110),
('ALOJ013', 'Apartamento Moderno', 1, 2, 'SI', 'NO', 'SI', 'NO', 80),
('ALOJ014', 'Casa del Mar', 3, 4, 'SI', 'SI', 'SI', 'SI', 160),
('ALOJ015', 'Dúplex Las Rocas', 3, 4, 'SI', 'SI', 'SI', 'NO', 120),
('ALOJ016', 'Estudio Urbano', 1, 1, 'NO', 'NO', 'SI', 'NO', 35),
('ALOJ017', 'Chalet Jardín Secreto', 3, 5, 'SI', 'SI', 'SI', 'SI', 180),
('ALOJ018', 'Piso Parque Central', 2, 4, 'SI', 'SI', 'SI', 'NO', 100),
('ALOJ019', 'Casa Río Claro', 2, 2, 'SI', 'SI', 'NO', 'NO', 95),
('ALOJ020', 'Loft Estación Norte', 1, 1, 'SI', 'NO', 'SI', 'NO', 55);

INSERT INTO UBICACION (CODIGO_ALOJAMIENTO, PAIS, CIUDAD, DIST_METRO, DIST_CENTRO) VALUES
('ALOJ001', 'Portugal', 'Liboa', 1.00, 2.00),
('ALOJ002', 'España', 'Madrid', 0.50, 0.80),
('ALOJ003', 'España', 'Barcelona', 0.90, 0.40),
('ALOJ004', 'Francia', 'Marsella', 3.00, 4.00),
('ALOJ005', 'Portugal', 'Oporto', 4.00, 3.00),
('ALOJ006', 'Francia', 'Paris', 2.00, 2.00),
('ALOJ007', 'Francia', 'Toulouse', 1.00, 3.00),
('ALOJ008', 'España', 'Barcelona', 2.00, 3.00),
('ALOJ009', 'España', 'Madrid', 2.00, 4.00),
('ALOJ010', 'España', 'Bilbao', 2.00, 5.00),
('ALOJ011', 'Italia', 'Milan', 0.50, 0.70),
('ALOJ012', 'Italia', 'Roma', 1.00, 0.80),
('ALOJ013', 'España', 'Sevilla', 2.00, 0.90),
('ALOJ014', 'Italia', 'Cerdegna', 0.90, 4.00),
('ALOJ015', 'España', 'Málaga', 2.00, 4.00),
('ALOJ016', 'Italia', 'Roma', 2.00, 2.00),
('ALOJ017', 'Francia', 'Paris', 1.00, 2.00),
('ALOJ018', 'España', 'Ibiza', 2.00, 4.00),
('ALOJ019', 'Portugal', 'Lagos', 2.00, 2.00),
('ALOJ020', 'Portugal', 'Madeira', 3.00, 2.00);

INSERT INTO PRECIO (CODIGO_ALOJAMIENTO, PRECIO_ALQUILER, RESERVA, `%_RESERVA`) VALUES
('ALOJ001', 1800.00, 'SI', 100.00),
('ALOJ002', 780.00, 'SI', 25.00),
('ALOJ003', 800.00, 'NO', 0.00),
('ALOJ004', 1600.00, 'SI', 25.00),
('ALOJ005', 900.00, 'NO', 0.00),
('ALOJ006', 1200.00, 'NO', 0.00),
('ALOJ007', 1300.00, 'NO', 0.00),
('ALOJ008', 1500.00, 'SI', 25.00),
('ALOJ009', 1600.00, 'SI', 100.00),
('ALOJ010', 1750.00, 'SI', 25.00),
('ALOJ011', 1825.00, 'NO', 0.00),
('ALOJ012', 1750.00, 'NO', 0.00),
('ALOJ013', 1652.00, 'NO', 0.00),
('ALOJ014', 1941.00, 'NO', 0.00),
('ALOJ015', 1800.00, 'SI', 25.00),
('ALOJ016', 2000.00, 'SI', 30.00),
('ALOJ017', 2120.00, 'NO', 0.00),
('ALOJ018', 1900.00, 'SI', 25.00),
('ALOJ019', 1570.00, 'NO', 0.00),
('ALOJ020', 1580.00, 'NO', 0.00);

INSERT INTO PUNTUACION (CODIGO_ALOJAMIENTO, PUNTOS, AGENCIA, PUNTOS_AGENCIA) VALUES
('ALOJ001', 5.00, 'GlobalHome', 4.40),
('ALOJ002', 4.20, 'AndesRenta', 4.10),
('ALOJ003', 4.10, 'AlquilaFacil', 4.00),
('ALOJ004', 4.60, 'CaribeRent', 4.60),
('ALOJ005', 4.40, 'RentaTop', 3.80),
('ALOJ006', 4.30, 'TerraHouse', 4.90),
('ALOJ007', 4.90, 'SevillaRooms', 4.50),
('ALOJ008', 4.80, 'ChileVive', 4.30),
('ALOJ009', 4.70, 'MexicoRent', 4.80),
('ALOJ010', 4.80, 'UYAlquila', 4.90),
('ALOJ011', 4.00, 'MalagaTurismo', 4.90),
('ALOJ012', 4.20, 'CórdobaStay', 4.60),
('ALOJ013', 3.80, 'AndesElite', 4.30),
('ALOJ014', 4.70, 'BogotaLodge', 4.50),
('ALOJ015', 4.90, 'EasyStay Valencia', 4.70),
('ALOJ016', 4.30, 'PuntaAlquileres', 4.40),
('ALOJ017', 4.90, 'CuscoRenta', 4.40),
('ALOJ018', 4.70, 'MendozaRooms', 4.70),
('ALOJ019', 4.90, 'GDLRent', 4.20),
('ALOJ020', 4.90, 'VivaStay', 4.90);


-- ------------------------------------------------------------------------
--                            PROPERTY SHORTLIST AND RECOMMENDATION
-- ------------------------------------------------------------------------

-- Individual selection criteria

-- The client requires a terrace and air conditioning but does not want a swimming pool
SELECT * FROM ALOJAMIENTO WHERE
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND
TERRAZA = 'SI' AND
AIREC_ACOND = 'SI' AND
PISCINA = 'NO';

-- The client will not stay in a studio without a living room or in a property with only one bathroom
SELECT * FROM ALOJAMIENTO WHERE
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND
SALON = 'SI' AND
CANT_BANYOS > 1;

-- The property must have at least 80 square metres
SELECT * FROM ALOJAMIENTO WHERE
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND
SUPERFICIE >= 80;

-- To reduce noise, the property must be at least 1 km from a metro station and at least 2 km from the city centre
SELECT * FROM ALOJAMIENTO WHERE 
CODIGO_ALOJAMIENTO IN 
(SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE 
PAIS = 'España' AND
DIST_METRO >=1 AND
DIST_CENTRO >=2);

-- The permitted nightly price range is €1,500–€2,000
SELECT * FROM ALOJAMIENTO WHERE 
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND
CODIGO_ALOJAMIENTO IN 
(SELECT CODIGO_ALOJAMIENTO FROM PRECIO WHERE 
PRECIO_ALQUILER BETWEEN 1500 AND 2000);

-- The deposit must be 25%
SELECT * FROM ALOJAMIENTO WHERE 
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND
CODIGO_ALOJAMIENTO IN 
(SELECT CODIGO_ALOJAMIENTO FROM PRECIO WHERE 
`%_RESERVA`= 25);

-- The property must have a trust score above 4.5, and its agency must score above 4
SELECT * FROM ALOJAMIENTO WHERE
CODIGO_ALOJAMIENTO IN (SELECT CODIGO_ALOJAMIENTO FROM UBICACION WHERE PAIS = 'España') AND 
CODIGO_ALOJAMIENTO IN 
(SELECT CODIGO_ALOJAMIENTO FROM PUNTUACION WHERE 
PUNTOS > 4.5 AND
PUNTOS_AGENCIA > 4);


-- Combined candidate shortlist
SELECT * 
FROM ALOJAMIENTO AS a 
INNER JOIN UBICACION AS u
ON a.CODIGO_ALOJAMIENTO = u.CODIGO_ALOJAMIENTO
INNER JOIN PRECIO AS pr
ON a.CODIGO_ALOJAMIENTO = pr.CODIGO_ALOJAMIENTO
INNER JOIN PUNTUACION AS pu
ON a.CODIGO_ALOJAMIENTO = pu.CODIGO_ALOJAMIENTO
WHERE 
TERRAZA = 'SI' AND
AIREC_ACOND = 'SI' AND
PISCINA = 'NO' AND
SALON = 'SI' AND
CANT_BANYOS > 1 AND
SUPERFICIE >= 80 AND
PAIS = 'España' AND
DIST_METRO >=1 AND
DIST_CENTRO >=2 AND 
PRECIO_ALQUILER BETWEEN 1500 AND 2000 AND
`%_RESERVA`= 25 AND
PUNTOS > 4.5 AND
PUNTOS_AGENCIA > 4;

-- RECOMMENDATION
/* 
I would recommend Dúplex Las Rocas in Málaga (accommodation code ALOJ015).
I recommend this property for several reasons. First, it has the largest floor area among the candidates, 
with three bathrooms, matching Ático del Sol and exceeding Piso Parque Central,
and four bedrooms, matching Piso Parque Central and exceeding Ático del Sol.
It also has the highest property score among the candidates.
Although Ático del Sol is €50 cheaper, it is 1 km farther from the city centre, and 
its agency score is 0.20 points higher. I consider the greater floor area and number of bathrooms more important 
when making the final choice because eight people will stay there.
*/ 



-- ------------------------------------------------------------------------
--                             ADDITIONAL PROPERTY QUESTIONS
-- ------------------------------------------------------------------------

-- What is the total floor area of properties with a swimming pool?
SELECT SUM(SUPERFICIE) AS tot_superficie_con_piscina FROM ALOJAMIENTO WHERE PISCINA = 'SI';

-- Which property has the largest floor area?
SELECT CODIGO_ALOJAMIENTO, NOMBRE, SUPERFICIE FROM ALOJAMIENTO WHERE SUPERFICIE = (SELECT MAX(SUPERFICIE) FROM ALOJAMIENTO);

-- Which property has the smallest floor area?
SELECT CODIGO_ALOJAMIENTO, NOMBRE, SUPERFICIE FROM ALOJAMIENTO WHERE SUPERFICIE = (SELECT MIN(SUPERFICIE) FROM ALOJAMIENTO);

-- How many properties have a living room, and how many have a terrace?
SELECT 
SUM(CASE WHEN SALON = 'SI' THEN 1 ELSE 0 END) AS num_aloj_con_salon,
SUM(CASE WHEN TERRAZA = 'SI' THEN 1 ELSE 0 END) AS num_aloj_con_terraza
FROM ALOJAMIENTO;


-- How many properties are listed for each country in UBICACION?
SELECT PAIS, COUNT(*) AS total_propiedades FROM UBICACION GROUP BY PAIS;

-- What is the average rental price across all properties in PRECIO?
SELECT ROUND(AVG(PRECIO_ALQUILER),2) AS promedio_precios FROM PRECIO;

-- Which agencies have the highest agency score?
SELECT AGENCIA, PUNTOS_AGENCIA FROM PUNTUACION WHERE PUNTOS_AGENCIA = (SELECT MAX(PUNTOS_AGENCIA) FROM PUNTUACION);






