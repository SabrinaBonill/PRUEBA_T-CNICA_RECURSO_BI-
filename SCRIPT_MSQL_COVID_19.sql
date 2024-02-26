
-- CREACIÓN DE TABLAS MYSQL

-- La tabla principal Cases Fue alimentada de la ETL Python, porteriormente con esta creada se procedio a cerar tabalas de dimensiones del moelelo.

-- se Crea Base de Datos

CREATE DATABASE prueba_practica;

-- Cambio tipo de datos en cases

USE prueba_practica ;

ALTER TABLE cases MODIFY COLUMN id_case INT;
ALTER TABLE cases MODIFY COLUMN  id_municipality INT;
ALTER TABLE cases MODIFY COLUMN name_municipality VARCHAR(200);
ALTER TABLE cases MODIFY COLUMN id_department INT;
ALTER TABLE cases MODIFY COLUMN name_department VARCHAR(45);
ALTER TABLE cases MODIFY COLUMN age INT;
ALTER TABLE cases MODIFY COLUMN gender VARCHAR(45);
ALTER TABLE cases MODIFY COLUMN id_gender INT;
ALTER TABLE cases MODIFY COLUMN type_contagion VARCHAR(45);
ALTER TABLE cases MODIFY COLUMN id_type_contagion INT;
ALTER TABLE cases MODIFY COLUMN status VARCHAR(45);
ALTER TABLE cases MODIFY COLUMN id_status INT;
ALTER TABLE cases MODIFY COLUMN date_symptom DATETIME;
ALTER TABLE cases MODIFY COLUMN date_death DATETIME;
ALTER TABLE cases MODIFY COLUMN date_diagnosis DATETIME;
ALTER TABLE cases MODIFY COLUMN date_recovery DATETIME;


-- Crear Tabla department

CREATE TABLE department
SELECT DISTINCT id_department, name_department
FROM cases
ORDER BY name_department;

ALTER TABLE department ADD PRIMARY KEY (id_department);

-- Crear Tabla municipality

CREATE TABLE municipality
SELECT DISTINCT id_municipality, name_municipality, id_department
FROM cases
ORDER BY name_municipality;

-- Crear Tabla gender

CREATE TABLE gender
SELECT DISTINCT id_gender, gender
FROM cases ;

ALTER TABLE gender ADD PRIMARY KEY ( id_gender);


-- Crear Tabla type_contagion

CREATE TABLE type_contagion
SELECT DISTINCT id_type_contagion, type_contagion
FROM cases
ORDER BY type_contagion;

ALTER TABLE type_contagion ADD PRIMARY KEY ( id_type_contagion);

-- Crear Tabla status

CREATE TABLE status
SELECT DISTINCT id_status, status
FROM cases
ORDER BY status;

ALTER TABLE status ADD PRIMARY KEY (id_status);

-- Crear relaciones

-- fk_departament_municipality

ALTER TABLE municipality
ADD CONSTRAINT fk_department_municipality
FOREIGN KEY (id_department) REFERENCES department(id_department);


-- fk_municipality_cases PENDIENTE

DESCRIBE cases;
DESCRIBE municipality;

ALTER TABLE cases
ADD CONSTRAINT fk_municipality_cases
FOREIGN KEY (id_municipality) REFERENCES municipality(id_municipality);

-- fk_municipality_state

DESCRIBE cases;
DESCRIBE status;

ALTER TABLE cases
ADD CONSTRAINT fk_status_cases
FOREIGN KEY (id_status) REFERENCES status(id_status);

-- fk_type_contagion_cases

DESCRIBE cases;
DESCRIBE type_contagion;

ALTER TABLE cases
ADD CONSTRAINT fk_type_contagion_cases
FOREIGN KEY (id_type_contagion) REFERENCES type_contagion(id_type_contagion);


-- fk_gender_cases

DESCRIBE cases;
DESCRIBE gender;

ALTER TABLE cases
ADD CONSTRAINT fk_gender_cases
FOREIGN KEY (id_gender) REFERENCES gender(id_gender);