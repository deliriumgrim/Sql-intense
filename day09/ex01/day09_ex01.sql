CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO person_audit (row_id, type_event, name, age, gender, address)
    VALUES (old.id, 'U', old.name, old.age, old.gender, old.address);
    RETURN NULL;
END;
$$;

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;