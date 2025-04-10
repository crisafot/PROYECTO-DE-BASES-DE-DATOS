## AMPLIACION DE LA BASE DE DATOS

  USE techsolutions;

-- AÑADIR COLUMNAS A LA TABLA EMPLEADOS
ALTER TABLE empleados
ADD COLUMN SueldoActual DECIMAL(10,2), -- Añadir sueldo actual del empleado
ADD COLUMN NumeroIdentificacion VARCHAR(20), -- Añadir número de identificación del empleado
ADD COLUMN FechaNacimiento DATE; -- Añadir fecha de nacimiento del empleado

-- CREAR TABLA DE ASISTENCIA
CREATE TABLE asistencias (
  idEmpleado INT NOT NULL, -- Llave foranea
  Fecha DATE NOT NULL, -- Añadir fecha de asistencia del empleado
  HoraEntrada TIME, -- Añadir hora de entrada del empleado
  HoraSalida TIME, -- Añadir hora de salida del empleado
  PRIMARY KEY (idEmpleado, Fecha), -- Llave primaria es compuesta, idEmpleado + fecha
  FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
);
