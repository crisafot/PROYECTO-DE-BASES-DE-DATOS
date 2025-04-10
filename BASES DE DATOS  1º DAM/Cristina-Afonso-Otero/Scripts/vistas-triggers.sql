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
