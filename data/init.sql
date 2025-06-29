-- Borramos las tablas para que se creen en cada ejecución.
DROP VIEW IF EXISTS predicciones;
DROP TABLE IF EXISTS modelo_salario;
DROP TABLE IF EXISTS modelo_salario_summary;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS edades_a_predecir;

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    edad INT,
    salario FLOAT
);

INSERT INTO empleados (edad, salario) VALUES
(25, 30000),
(30, 35000),
(35, 40000),
(40, 45000),
(45, 50000);

CREATE TABLE edades_a_predecir (
    edad DOUBLE PRECISION
);

INSERT INTO edades_a_predecir (edad) VALUES
(60), (80), (20), (34), (66);

CREATE EXTENSION IF NOT EXISTS madlib;

-- Se entrena el modelo de regresión lineal
SELECT madlib.linregr_train(
    'empleados',
    'modelo_salario',
    'salario',
    'ARRAY[1.0, edad::DOUBLE PRECISION]'
);

CREATE VIEW predicciones AS
SELECT
    e.edad,
    m.coef[1] + m.coef[2] * e.edad AS salario_estimado
FROM
    edades_a_predecir e,
    modelo_salario m;


SELECT * FROM predicciones