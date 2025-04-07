USE TechSolutions;

-- MUESTRA TODOS LOS EMPLEADOS DE UN DEPARTAMENTO
SELECT Empleados.idEmpleado, Empleados.Nombre, Empleados.Apellidos, Departamentos.NombreDepartamento
FROM Empleados
JOIN Departamentos ON Empleados.Departamentos_idDepartamento = Departamentos.idDepartamento
WHERE Departamentos.NombreDepartamento = 'Recursos Humanos';

-- NUMERO DE EMPLEADOS EN CADA DEPARTAMENTO
SELECT Departamentos.NombreDepartamento, COUNT(Empleados.idEmpleado) AS Numero_Empleados
FROM Empleados
JOIN Departamentos ON Empleados.Departamentos_idDepartamento = Departamentos.idDepartamento
GROUP BY Departamentos.NombreDepartamento;

-- SUMA DE SALARIOS EN UN DEPARTAMENTO
SELECT SUM(Empleados.Salario) AS Total_Salarios, Departamentos.NombreDepartamento
FROM Empleados
JOIN Departamentos ON Empleados.Departamentos_idDepartamento = Departamentos.idDepartamento
WHERE Departamentos.NombreDepartamento = 'Ventas';

-- MOSTRAR LOS DEPARTAMENTOS CON MAS EMPLEADOS
SELECT departamentos.NombreDepartamento, COUNT(empleados.idEmpleado) AS Numero_Empleados
FROM empleados
JOIN departamentos ON empleados.Departamentos_idDepartamento = departamentos.idDepartamento
GROUP BY departamentos.NombreDepartamento
ORDER BY Numero_Empleados DESC;

-- EMPLADOS CON SALARIO MENOR A 30000
SELECT Empleados.Nombre, Empleados.Apellidos, Empleados.Salario
FROM Empleados
WHERE Empleados.Salario < 30000;

-- DEPARTAMENTOS CON MÁS EMPLEADOS
SELECT Departamentos.NombreDepartamento, COUNT(Empleados.idEmpleado) AS Numero_Empleados
FROM Departamentos
JOIN Empleados ON Empleados.Departamentos_idDepartamento = Departamentos.idDepartamento
GROUP BY Departamentos.NombreDepartamento
ORDER BY Numero_Empleados DESC;

-- EMPLEADOS CON MÁS DE UN PUESTO
SELECT Empleados.Nombre, Empleados.Apellidos, COUNT(Puestos.idPuestosDeTrabajo) AS Numero_Puestos
FROM Empleados
JOIN Puestos ON Puestos.idPuestosDeTrabajo = Empleados.Puestos_idPuestosDeTrabajo
GROUP BY Empleados.Nombre, Empleados.Apellidos
HAVING Numero_Puestos > 1;

-- EMPLEADOS CON ANTIGUEDAD MAYOR A 5 AÑOS
SELECT empleados.Nombre, empleados.Apellidos, empleados.Antiguedad
FROM empleados
WHERE empleados.Antiguedad > 5;
