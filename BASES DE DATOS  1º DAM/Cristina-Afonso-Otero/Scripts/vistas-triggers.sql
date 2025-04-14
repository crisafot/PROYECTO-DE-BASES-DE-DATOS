-- VISTAS TRIGGER

-- Convertir nombre y apellidos a mayúsculas automáticamente
DELIMITER $$
CREATE TRIGGER nombres_mayusculas
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
  SET NEW.Nombre = UPPER(NEW.Nombre);
  SET NEW.Apellidos = UPPER(NEW.Apellidos);
END$$
DELIMITER ;

-- Insertar automáticamente la hora de entrada
DELIMITER $$
CREATE TRIGGER hora_entrada_default
BEFORE INSERT ON asistencias
FOR EACH ROW
BEGIN
  IF NEW.HoraEntrada IS NULL THEN
    SET NEW.HoraEntrada = CURTIME();
  END IF;
END$$
DELIMITER ;

-- Evitar registros de asistencia con fecha futura
DELIMITER $$
CREATE TRIGGER validar_fecha_asistencia
BEFORE INSERT ON asistencias
FOR EACH ROW
BEGIN
  IF NEW.Fecha > CURDATE() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede registrar asistencia en el futuro.';
  END IF;
END$$
DELIMITER ;

-- Asignar salario mínimo si no se especifica sueldo
DELIMITER $$
CREATE TRIGGER asignar_sueldo_minimo
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
  IF NEW.SueldoActual IS NULL THEN
    SELECT SalarioMinimo INTO NEW.SueldoActual
    FROM puestos
    WHERE idPuestosDeTrabajo = NEW.Puestos_idPuestosDeTrabajo;
  END IF;
END$$
DELIMITER ;

-- Vista de Empleados y Jefes de Departamento
CREATE VIEW vista_empleados_jefes_departamento AS
SELECT empleados.idEmpleado, empleados.Nombre, empleados.Apellidos, empleados.SueldoActual, 
       departamentos.Nombre AS Departamento,
       jefe.Nombre AS JefeDepartamento
FROM empleados
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
LEFT JOIN empleados AS jefe ON empleados.idEmpleadoJefe = jefe.idEmpleado;

-- Vista de Empleados con Antigüedad Mayor a 5 Años
CREATE VIEW vista_empleados_antiguedad AS
SELECT empleados.idEmpleado, empleados.Nombre, empleados.Apellidos, empleados.FechaNacimiento, 
       empleados.SueldoActual, empleados.FechaContratacion
FROM empleados
WHERE DATEDIFF(CURDATE(), empleados.FechaContratacion) > 1825; -- 1825 días = 5 años

-- Vista de Asistencia Diaria por Empleado
CREATE VIEW vista_asistencia_diaria AS
SELECT empleados.idEmpleado, empleados.Nombre, empleados.Apellidos, asistencias.Fecha, 
       asistencias.HoraEntrada, asistencias.HoraSalida
FROM asistencias
JOIN empleados ON asistencias.idEmpleado = empleados.idEmpleado
ORDER BY asistencias.Fecha DESC;

-- Vista de Promedio de Salario por Departamento
CREATE VIEW vista_promedio_sueldo_departamento AS
SELECT departamentos.Nombre AS Departamento, AVG(empleados.SueldoActual) AS PromedioSueldo
FROM empleados
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
GROUP BY departamentos.Nombre;
