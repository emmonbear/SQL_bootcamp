CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
       START WITH 1
       OWNED BY person_discounts.id;

SELECT SETVAL('seq_person_discounts', COUNT(id))
  FROM person_discounts;
ALTER TABLE person_discounts
      ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');