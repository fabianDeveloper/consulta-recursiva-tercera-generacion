CREATE OR REPLACE FUNCTION tercera_generacion(varchar)
    RETURNS TABLE(id smallint, nombre varchar, id_padre smallint, id_madre smallint, generacion integer)
	LANGUAGE PLPGSQL
    AS
$$
DECLARE
	nombre ALIAS FOR $1;
BEGIN
    RETURN QUERY
	WITH RECURSIVE nodo AS (
        SELECT persona_id, persona_nombre, persona_id_padre, persona_id_madre, 0 AS gen
        FROM persona
        WHERE persona_nombre = UPPER(nombre)
	), ar1 as (
		SELECT * FROM nodo
		UNION ALL
		SELECT ar1.persona_id, ar1.persona_nombre, ar1.persona_id_padre, ar1.persona_id_madre, nodo.gen -1 AS gen
        FROM persona ar1 
        JOIN nodo ON ar1.persona_id = nodo.persona_id_padre		
	), ar2 as (
		SELECT * FROM ar1
		UNION ALL
		SELECT ar2.persona_id, ar2.persona_nombre, ar2.persona_id_padre, ar2.persona_id_madre,  ar1.gen -1 AS gen
        FROM persona ar2 
        JOIN ar1 ON ar2.persona_id = ar1.persona_id_madre	
	), ar3 as (
		SELECT * FROM ar1
		UNION ALL
		SELECT ar3.persona_id, ar3.persona_nombre, ar3.persona_id_padre, ar3.persona_id_madre, ar1.gen -1 AS gen
        FROM persona ar3
        JOIN ar1 ON ar3.persona_id = ar1.persona_id_padre
	), ar4 as(
		SELECT * FROM ar3
		UNION ALL
		SELECT ar4.persona_id, ar4.persona_nombre, ar4.persona_id_padre, ar4.persona_id_madre, ar3.gen -1 AS gen
        FROM persona ar4
        JOIN ar3 ON ar4.persona_id = ar3.persona_id_madre
	), ar5 as(
		SELECT * FROM ar4
		UNION ALL
		SELECT ar5.persona_id, ar5.persona_nombre, ar5.persona_id_padre, ar5.persona_id_madre, ar4.gen -1 AS gen
        FROM persona ar5
        JOIN ar4 ON ar5.persona_id = ar4.persona_id_padre
	), ar6 as(
		SELECT * FROM ar5
		UNION ALL
		SELECT ar6.persona_id, ar6.persona_nombre, ar6.persona_id_padre, ar6.persona_id_madre, ar5.gen -1 AS gen
        FROM persona ar6
        JOIN ar5 ON ar6.persona_id = ar5.persona_id_madre
	), ab1 as (
		SELECT * FROM ar6
		UNION ALL
		SELECT ab1.persona_id, ab1.persona_nombre, ab1.persona_id_padre, ab1.persona_id_madre, ar6.gen +1 AS gen
        FROM persona ab1
        JOIN ar6 ON ar6.persona_id = ab1.persona_id_padre
	), ab2 as (
		SELECT * FROM ab1
		UNION ALL
		SELECT ab2.persona_id, ab2.persona_nombre, ab2.persona_id_padre, ab2.persona_id_madre, ab1.gen +1 AS gen
        FROM persona ab2
        JOIN ab1 ON ab1.persona_id = ab2.persona_id_madre
	), ab3 as (
		SELECT * FROM ab2
		UNION ALL
		SELECT ab3.persona_id, ab3.persona_nombre, ab3.persona_id_padre, ab3.persona_id_madre, ab2.gen +1 AS gen
        FROM persona ab3
        JOIN ab2 ON ab2.persona_id = ab3.persona_id_padre
	), ab4 as (
		SELECT * FROM ab3
		UNION ALL
		SELECT ab4.persona_id, ab4.persona_nombre, ab4.persona_id_padre, ab4.persona_id_madre, ab3.gen +1 AS gen
        FROM persona ab4
        JOIN ab3 ON ab3.persona_id = ab4.persona_id_madre
	), ab5 as (
		SELECT * FROM ab4
		UNION ALL
		SELECT ab5.persona_id, ab5.persona_nombre, ab5.persona_id_padre, ab5.persona_id_madre, ab4.gen +1 AS gen
        FROM persona ab5
        JOIN ab4 ON ab4.persona_id = ab5.persona_id_padre
	), ab6 as (
		SELECT * FROM ab4
		UNION ALL
		SELECT ab6.persona_id, ab6.persona_nombre, ab6.persona_id_padre, ab6.persona_id_madre, ab5.gen +1 AS gen
        FROM persona ab6
        JOIN ab5 ON ab5.persona_id = ab6.persona_id_madre
	), ultimo as (
		SELECT * FROM ar1 UNION SELECT * FROM ar2 UNION SELECT * FROM ar3 UNION
		SELECT * FROM ar4 UNION SELECT * FROM ar5 UNION SELECT * FROM ar6 UNION
		SELECT * FROM ab1 UNION SELECT * FROM ab2 UNION SELECT * FROM ab3 UNION
		SELECT * FROM ab4 UNION SELECT * FROM ab5 UNION SELECT * FROM ab6
	)
	SELECT * FROM ultimo WHERE ultimo.gen = 3 ORDER BY gen ASC;									
END;
$$
