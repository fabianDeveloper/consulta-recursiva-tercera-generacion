-- ESPOSA DE WILFRIDO (3)
INSERT INTO PERSONA VALUES (13, 'MARTHA', 'TOLEDO', 'FEMENINO');
-- ESPOSA DE ROBERTH (7)
INSERT INTO PERSONA VALUES (14, 'MARIA', 'VÉLEZ', 'FEMENINO');
-- ESPOSA DE MARLON (9)
INSERT INTO PERSONA VALUES (15, 'LISBETH', 'GONZALEZ', 'FEMENINO');
-- ESPOSO DE ORALIA (5)
INSERT INTO PERSONA VALUES (16, 'PEDRO', 'ZAMBRANO', 'MASCULINO');

-- GENERACIONES
INSERT INTO PERSONA VALUES (1, 'LUIS', 'MEDINA', 'MASCULINO');
INSERT INTO PERSONA VALUES (2, 'CARMEN', 'GILCES', 'FEMENINO');

-- GENERACIÓN 1
INSERT INTO PERSONA VALUES (3, 'WILFRIDO', 'MEDINA', 'MASCULINO', 1, 2);
INSERT INTO PERSONA VALUES (4, 'AUXILIADORA', 'MEDINA', 'FEMENINO', 1, 2);
INSERT INTO PERSONA VALUES (5, 'ORALIA', 'MEDINA', 'FEMENINO', 1, 2);
INSERT INTO PERSONA VALUES (6, 'WILSON', 'MEDINA', 'MASCULINO', 1, 2);

-- GENERACIÓN 2
INSERT INTO PERSONA VALUES (7, 'ROBERT', 'MEDINA', 'MASCULINO', 3, 13);
INSERT INTO PERSONA VALUES (8, 'MAYRA', 'MEDINA', 'FEMENINO', 3, 13);
INSERT INTO PERSONA VALUES (9, 'MARLON', 'ZAMBRANO', 'MASCULINO', 16, 5);
INSERT INTO PERSONA VALUES (10, 'NICOLE', 'ZAMBRANO', 'FEMENINO', 16, 5);

-- GENERACIÓN 3
INSERT INTO PERSONA VALUES (11, 'AMAIA', 'MEDINA', 'FEMENINO', 7, 14);
INSERT INTO PERSONA VALUES (12, 'JEAN', 'ZAMBRANO', 'MASCULINO', 9, 15);

-- INGRESO DE UNA NUEVA GENERACIÓN
INSERT INTO PERSONA VALUES (17, 'BYRON', 'TORRES', 'MASCULINO', null, 11);
INSERT INTO PERSONA VALUES (18, 'ISABELLA', 'ZAMBRANO', 'FEMENINO', 12);