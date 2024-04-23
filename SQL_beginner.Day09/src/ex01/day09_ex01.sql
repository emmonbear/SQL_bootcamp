-- Active: 1711731107020@@127.0.0.1@5432@model
 CREATE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
  BEGIN
        INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
        VALUES('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN NULL;

    END;
$$ LANGUAGE PLPGSQL;
 
 CREATE TRIGGER trg_person_update_audit
  AFTER UPDATE ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person 
   SET name = 'Bulat' 
 WHERE id = 10;
UPDATE person 
   SET name = 'Damir' 
 WHERE id = 10;

 SELECT *
FROM person_audit;
