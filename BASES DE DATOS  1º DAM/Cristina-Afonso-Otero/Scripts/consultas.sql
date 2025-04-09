USE TechSolutions;

-- MUESTRA TODOS LOS EMPLEADOS CON SU CARGO Y DEPARTAMENTO
SELECT empleados.Nombre, empleados.Apellidos, puestos.NombreCargo, departamentos.NombreDepartamento
FROM empleados
JOIN puestos ON empleados.Puestos_idPuestosDeTrabajo = puestos.idPuestosDeTrabajo
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento;

-- NUMERO DE EMPLEADOS POR DEPARTAMENTO
SELECT departamentos.NombreDepartamento, COUNT(empleados.idEmpleado) AS TotalEmpleados
FROM empleados
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
GROUP BY departamentos.NombreDepartamento;

-- PROMEDIO DE SALARIO POR PUESTO
SELECT puestos.NombreCargo, (puestos.SalarioMinimo + puestos.SalarioMaximo) / 2 AS SalarioPromedio
FROM puestos;

-- EMPLEADOS QUE SON JEFES
SELECT empleados.Nombre, empleados.Apellidos, puestos.NombreCargo, departamentos.NombreDepartamento
FROM empleados
JOIN puestos ON empleados.Puestos_idPuestosDeTrabajo = puestos.idPuestosDeTrabajo
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
WHERE empleados.TipoEmpleado = 'Jefe';

-- EMPLEADOS CON ANTIGÜEDAD MAYOR A 5 AÑOS
SELECT empleados.Nombre, empleados.Apellidos, empleados.Antiguedad
FROM empleados
WHERE empleados.Antiguedad > 5;

-- SUMA DE SALARIOS ESTIMADOS POR DEPARTAMENTO (PROMEDIO POR EMPLEADO)
SELECT departamentos.NombreDepartamento, SUM((puestos.SalarioMinimo + puestos.SalarioMaximo) / 2) AS TotalSalariosEstimados
FROM empleados
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
JOIN puestos ON empleados.Puestos_idPuestosDeTrabajo = puestos.idPuestosDeTrabajo
GROUP BY departamentos.NombreDepartamento;
