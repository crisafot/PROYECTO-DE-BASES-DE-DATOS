-- -----------------------------------------------------
-- Script de creación de base de datos: techsolutions
-- -----------------------------------------------------

CREATE DATABASE IF NOT EXISTS techsolutions;
USE techsolutions;

-- Configuración inicial del servidor
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- -----------------------------------------------------
-- Tabla: departamentos
-- -----------------------------------------------------
DROP TABLE IF EXISTS departamentos;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE departamentos (
  idDepartamento INT NOT NULL AUTO_INCREMENT,
  NombreDepartamento VARCHAR(45) NOT NULL,
  PRIMARY KEY (idDepartamento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Tabla: puestos
-- -----------------------------------------------------
DROP TABLE IF EXISTS puestos;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE puestos (
  idPuestosDeTrabajo INT NOT NULL AUTO_INCREMENT,
  NombreCargo VARCHAR(45) NOT NULL,
  SalarioMaximo DECIMAL(10,0) NOT NULL,
  SalarioMinimo DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (idPuestosDeTrabajo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Tabla: empleados
-- -----------------------------------------------------
DROP TABLE IF EXISTS empleados;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE empleados (
  idEmpleado INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Apellidos VARCHAR(45) NOT NULL,
  Sexo ENUM('M','F','OTRO') DEFAULT NULL,
  TipoEmpleado ENUM('Jefe','Empleado') NOT NULL,
  Antiguedad INT NOT NULL,
  Departamentos_idDepartamento INT NOT NULL,
  Puestos_idPuestosDeTrabajo INT NOT NULL,
  PRIMARY KEY (idEmpleado, Departamentos_idDepartamento, Puestos_idPuestosDeTrabajo),
  KEY fk_Empleados_Departamentos_idx (Departamentos_idDepartamento),
  KEY fk_Empleados_Puestos1_idx (Puestos_idPuestosDeTrabajo),
  CONSTRAINT fk_Empleados_Departamentos FOREIGN KEY (Departamentos_idDepartamento) REFERENCES departamentos (idDepartamento),
  CONSTRAINT fk_Empleados_Puestos1 FOREIGN KEY (Puestos_idPuestosDeTrabajo) REFERENCES puestos (idPuestosDeTrabajo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- -----------------------------------------------------
-- Restaura configuración del servidor
-- -----------------------------------------------------
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
