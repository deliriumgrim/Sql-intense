CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO person_audit (row_id, type_event, name, age, gender, address)
    VALUES (old.id, 'D', old.name, old.age, old.gender, old.address);
    RETURN NULL;
END;
$$;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;