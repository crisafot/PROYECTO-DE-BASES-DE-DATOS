USE techsolutions;

-- Inserciones en la tabla departamentos
INSERT INTO departamentos (NombreDepartamento) VALUES
('Recursos Humanos'),   -- ID 1
('Informática'),        -- ID 2
('Finanzas'),           -- ID 3
('Marketing'),          -- ID 4
('Stakeholders');       -- ID 5

-- Inserciones en la tabla puestos
INSERT INTO puestos (NombreCargo, SalarioMaximo, SalarioMinimo) VALUES
('Gerente de Proyecto', 65000, 45000),       -- ID 1
('Desarrollador Backend', 55000, 35000),     -- ID 2
('QA', 50000, 30000),                        -- ID 3
('Jefe de RRHH', 60000, 40000),              -- ID 4
('Psicólogo', 45000, 30000),                 -- ID 5
('Asesor Fiscal', 55000, 35000),             -- ID 6
('Analista Financiero', 50000, 32000),       -- ID 7
('Director Financiero', 80000, 50000),       -- ID 8
('Contable', 40000, 25000),                  -- ID 9
('Analista de Datos', 55000, 35000),         -- ID 10
('Director Marketing', 75000, 45000),        -- ID 11
('Diseñador Gráfico', 38000, 24000),         -- ID 12
('Especialista en RRHH', 42000, 28000),      -- ID 13
('CEO', 100000, 70000);                      -- ID 14

-- Inserciones en la tabla empleados
INSERT INTO empleados (Nombre, Apellidos, Sexo, TipoEmpleado, Antiguedad, Departamentos_idDepartamento, Puestos_idPuestosDeTrabajo) VALUES
('Samuel', 'Alonso García', 'M', 'Jefe', 10, 2, 1),  -- Gerente de Informática
('Daniela', 'Fernández Ruiz', 'F', 'Empleado', 4, 2, 2),  -- Desarrollador Backend
('Duke', 'Wall', 'M', 'Empleado', 5, 2, 3),  -- QA
('Eugenia', 'Gómez Martín', 'F', 'Empleado', 2, 2, 2),  -- Desarrollador Backend
('Eric', 'Sánchez Muñoz', 'M', 'Jefe', 7, 1, 4),  -- Jefe de RRHH
('Nicole', 'Jiménez Pérez', 'F', 'Empleado', 3, 1, 13),  -- Especialista en RRHH
('Vicente', 'Gracia Galán', 'M', 'Empleado', 2, 1, 5),  -- Psicólogo
('Marco', 'López González', 'M', 'Empleado', 4, 3, 6),  -- Asesor Fiscal
('Felipe', 'Gutiérrez López', 'M', 'Empleado', 5, 3, 7),  -- Analista Financiero
('Eugenio', 'Bartolomé Benítez', 'M', 'Jefe', 7, 3, 8),  -- Director Financiero
('Ibán', 'Saou García', 'M', 'Empleado', 5, 3, 9),  -- Contable
('Eduardo', 'Suarez Afonso', 'M', 'Jefe', 3, 4, 11), -- Director de Marketing
('Cristina', 'Martín Otero', 'F', 'Empleado', 2, 4, 4),  -- Diseñadora en Marketing (¿puesto correcto?)
('Julia', 'Gómez Fuentes', 'F', 'Empleado', 2, 4, 10),  -- Analista de Datos
('Aitor', 'García Hernández', 'M', 'Empleado', 1, 4, 12),  -- Diseñador Gráfico
('Sofía', 'Alonso Otero', 'F', 'Jefe', 12, 5, 14);  -- CEO

