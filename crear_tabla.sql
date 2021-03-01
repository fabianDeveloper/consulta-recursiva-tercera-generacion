CREATE TABLE PERSONA(
    persona_id smallint PRIMARY KEY,
    persona_nombre varchar(30),
    persona_apellido varchar(30),
    persona_genero varchar(30),
    persona_id_padre smallint,
    persona_id_madre smallint,

CONSTRAINT padre_FK FOREIGN KEY (persona_id_padre) REFERENCES PERSONA (persona_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT madre_FK FOREIGN KEY (persona_id_madre) REFERENCES PERSONA (persona_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
