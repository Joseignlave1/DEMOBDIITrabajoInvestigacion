# DEMO del trabajo de investigación para Base de Datos II del Grupo 3

Este proyecto es una demostración de cómo ejecutar un modelo de regresión lineal utilizando PostgreSQL con la extensión MADlib embebida.

## Requisitos

- Docker
- Docker Compose
- Git

## Pasos para levantar el proyecto

1. **Clonar el repositorio:**

   ```bash
   git clone https://github.com/Joseignlave1/DEMOBDIITrabajoInvestigacion.git
   cd DEMOBDIITrabajoInvestigacion
   ```

2. **Levantar el contenedor con PostgreSQL y MADlib:**

   ```bash
   docker compose up
   ```

   Esto descargará la imagen `jonixis/postgres-madlib`, levantará la base de datos en el puerto 5432 y ejecutará el script de inicialización si no existe previamente.

3. **Ejecutar el archivo de inicialización que contiene las consultas SQL del proyecto:**

   ```bash
   docker exec -i postgres-madlib psql -U postgres -d postgres < data/init.sql
   ```

   Esto creará las tablas `empleados` y `edades_a_predecir`, entrenará el modelo `modelo_salario` y generará la vista `predicciones` con los valores estimados.

